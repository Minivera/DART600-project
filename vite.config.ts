import { defineConfig } from 'vite';
import reactRefresh from '@vitejs/plugin-react-refresh';
import { ViteAliases } from 'vite-aliases';

export default defineConfig({
  base: process.env.NODE_ENV === 'production' ? '/dart600-creative-project/' : '',
  plugins: [reactRefresh({
    exclude: /__generated__/,
  }), ViteAliases()],
});
