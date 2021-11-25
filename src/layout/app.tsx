/** @jsx jsx */
import React from 'react';
import { jsx, ThemeProvider } from '@emotion/react';
import { DndProvider } from 'react-dnd';
import { HTML5Backend } from 'react-dnd-html5-backend';

import { Game } from '../game/game';
import { theme } from '../theme';

import storyContent from '../../data/project.json?raw';

export const App: React.FunctionComponent = () => (
  <DndProvider backend={HTML5Backend}>
    <ThemeProvider theme={theme}>
      <Game storyContent={storyContent} />
    </ThemeProvider>
  </DndProvider>
);
