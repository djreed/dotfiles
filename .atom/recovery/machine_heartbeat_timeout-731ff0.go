package node

import "github.com/djreed/raft/data"

func HandleHeartbeatTimeout(n *Node) (data.MessageList, bool) {
	pendingCommit := n.PendingCommits()

	messages := make(data.MessageList, 0)
	for idx, nodeId := range n.Neighbors {
		msgCore := n.NewMessageCore(nodeId, data.APPEND_MSG)
		termCore := n.NewTermCore()

		toSendIdx := n.State.IndexToSend(idx) // Index of new entries
		// replicatedIdx := n.State.IndexReplicated(idx) // TODO Why?

		ERR.Printf("\n\n\nLOG LENGTH: %v\n\n\n", len(n.State.Log))
		ERR.Printf("\n\n\nTO SEND IDX: %v\n\n\n", toSendIdx)

		prevLogIdx := toSendIdx - 1 // preceding
		prevLogTerm := n.State.Log[prevLogIdx].Term
		entriesToSend := n.State.Log[toSendIdx:] // TODO batching
		leaderCommit := n.State.CommitIndex

		request := data.AppendEntries{
			MessageCore:  msgCore,
			TermCore:     termCore,
			Entries:      entriesToSend,
			PrevLogIndex: prevLogIdx, // Preceding
			PrevLogTerm:  prevLogTerm,
			LeaderCommit: leaderCommit,
		}

		// TODO actually build the entry messages

		messages = append(messages, request)
	}

	n.ResetHeartbeatTimeout()
	return messages, pendingCommit
}
