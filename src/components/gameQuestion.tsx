/** @jsx jsx */
import React, { FunctionComponent } from 'react';
import { css, jsx } from '@emotion/react';
import { darken, transparentize } from 'polished';

import { Question } from '../game/gameState';
import { useDrop } from 'react-dnd';

export interface GameQuestionProps {
  question: Question;
}

export const GameQuestion: FunctionComponent<GameQuestionProps> = ({
  question,
}) => {
  const [{ isOver }, drop] = useDrop(
    () => ({
      accept: 'clue',
      collect: monitor => ({
        isOver: monitor.isOver(),
      }),
    }),
    []
  );

  const hasWrongClues =
    question.feedback && question.selectedClues.length === question.cluesNeeded;

  const cluesSpots: React.ReactElement[] = [];
  if (question) {
    for (let i = 0; i < question.cluesNeeded; i++) {
      const Component: FunctionComponent = ({ children }) => (
        <div
          css={theme => css`
            width: calc(50% - 2rem);
            margin: 1rem;
            color: ${darken(0.5, theme.colors.primaryDark)};
            background-color: ${transparentize(0.4, theme.colors.primary)};
            border-radius: 15px;
            height: 15rem;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0.5rem;
            box-shadow: 1px 1px 0.2rem 0.1rem ${theme.colors.text};

            ${hasWrongClues
              ? `
              background-color: ${transparentize(0.4, theme.colors.red)};
              border: 0.2rem solid ${theme.colors.red};
            `
              : ''}
          `}
        >
          {children}
        </div>
      );

      if (i < question.selectedClues.length) {
        const clue = question.selectedClues[i];

        cluesSpots.push(
          <Component key={i}>
            <div>
              <p
                css={css`
                  font-size: 1.1rem;
                  margin-bottom: 0.5rem;
                `}
                dangerouslySetInnerHTML={{ __html: clue[0] }}
              />
              <p
                css={css`
                  font-style: italic;
                  margin-top: 0.5rem;
                `}
              >
                {clue[1]}
              </p>
            </div>
          </Component>
        );
      } else {
        cluesSpots.push(
          <Component key={i}>
            <span
              css={theme => css`
                text-transform: uppercase;
                font-size: 1.2rem;
                color: ${transparentize(0.2, theme.colors.text)};
              `}
            >
              No clue
            </span>
          </Component>
        );
      }
    }
  }

  return (
    <div
      css={css`
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
      `}
    >
      <h2
        css={theme => css`
          display: flex;
          justify-content: center;
          padding-top: 0.5rem;
          padding-bottom: 0.5rem;
          text-transform: uppercase;
          background-color: ${transparentize(0.4, theme.colors.primary)};
          border-color: ${darken(0.2, theme.colors.primaryDark)};
          border-width: 0.5rem;
          border-top-style: solid;
          border-bottom-style: solid;
          align-self: stretch;
        `}
      >
        Question
      </h2>
      <p
        css={css`
          width: 720px;
        `}
      >
        {question.question}
      </p>
      {hasWrongClues && <p>{question.feedback}</p>}
      <div
        ref={drop}
        css={theme => css`
          width: 720px;
          display: flex;
          flex-wrap: wrap;

          ${isOver
            ? `
            & > div {
              box-shadow: 0 0 0.4rem 0.1rem ${theme.colors.text};
            }
          `
            : ''}
        `}
      >
        {cluesSpots}
      </div>
    </div>
  );
};
