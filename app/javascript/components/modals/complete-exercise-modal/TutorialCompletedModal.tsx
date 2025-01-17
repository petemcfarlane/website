import React from 'react'
import { Modal } from '../Modal'
import { GraphicalIcon } from '../../common'
import { Track } from '../../types'

export const TutorialCompletedModal = ({
  open,
  track,
}: {
  open: boolean
  track: Track
}): JSX.Element => {
  return (
    <Modal
      cover={true}
      open={open}
      className="m-completed-tutorial-exercise"
      onClose={() => {}}
    >
      <GraphicalIcon icon="hello-world" category="graphics" />
      <h2>You’ve completed “Hello, World!”</h2>
      <h3>This is just start of your journey on the {track.title} track 🚀</h3>
      <p>
        You’re now ready to get stuck into some{' '}
        <a href={track.links.exercises}>real exercises</a>.
        {/* TODO: Change to track.course */}
        {track.numConcepts > 0 ? (
          <>
            <br />
            We’ve also revealed {track.title}’s {track.numConcepts} concepts for
            you to take a look at.
          </>
        ) : (
          ''
        )}
      </p>
      <div className="info">
        Once you start your next exercise, you’ll have access to the mentoring
        section on your track too.
      </div>
      <div className="btns">
        {/* TODO: Change to track.course */}
        {track.numConcepts > 0 ? (
          <a href={track.links.concepts} className="btn-primary btn-m">
            <span>Show me the Concepts</span>
            <GraphicalIcon icon="arrow-right" />
          </a>
        ) : (
          <a href={track.links.exercises} className="btn-primary btn-m">
            Show me more exercises
          </a>
        )}
        <button className="btn">Return to “Hello, World!”</button>
      </div>
    </Modal>
  )
}
