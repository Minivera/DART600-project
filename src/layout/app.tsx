/** @jsx jsx */
import React from 'react';
import { jsx, ThemeProvider } from '@emotion/react';

import { Game } from '../game/game';
import { theme } from '../theme';

import storyContent from '../../data/project.json?raw';

export const App: React.FunctionComponent = () => (
  <ThemeProvider theme={theme}>
    <Game storyContent={storyContent} />
  </ThemeProvider>
);
