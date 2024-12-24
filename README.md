# Vite + React 環境を Docker で構築する

## プロジェクトの作成手順

### Vite プロジェクトの作成

```bash
docker-compose run --rm node yarn create vite {プロジェクト名} --template react-ts
```

### コンテナファイルのコピー

```bash
cp docker-compose.yml Dockerfile {プロジェクト名}
```

### 開発コンテナフォルダのコピー

```bash
cp -r .devcontainer {プロジェクト名}
```

### `docker-compose.yml` の修正

```yml
services:
  node:
    build:
      context: .
      dockerfile: Dockerfile
      args:
        - NODE_VERSION=latest
    tty: true
    volumes:
      - ./:/home/node/app
      # === これ以降の内容を追記 === #
      - node_modules:/home/node/app/node_modules
    ports:
      - 5173:5173
    command: /bin/bash -c "yarn install && yarn run dev"

volumes:
  node_modules:
```

### `package.json` の修正

```json
  "scripts": {
    "dev": "vite --host", // "vite" -> "vite --host" に変更
    "build": "tsc -b && vite build",
    "lint": "eslint .",
    "preview": "vite preview"
  },
```

## 拡張機能

### [Prettier - Code formatter](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

### [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

### [HTML CSS Support](https://marketplace.visualstudio.com/items?itemName=ecmel.vscode-html-css)

### [ES7 React/Redux/GraphQL/React-Native snippets](https://marketplace.visualstudio.com/items?itemName=rodrigovallades.es7-react-js-snippets)

### [Auto Complete Tag](https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-complete-tag)

### [Trailing Spaces](https://marketplace.visualstudio.com/items?itemName=shardulm94.trailing-spaces)

### [Zenkaku](https://marketplace.visualstudio.com/items?itemName=mosapride.zenkaku)

### [indent-rainbow](https://marketplace.visualstudio.com/items?itemName=oderwat.indent-rainbow)

## 参考

- [[Zenn] Vite + React 環境を Docker で構築する](https://zenn.dev/sg4k0/articles/1da799501d2018)
- [Vite + React 開発環境を Docker コンテナで構築](https://shinke1987.net/?p=1123)

- [[Qiita] フロントエンドのどんな環境でも必ず VSCode に入れる拡張機能](https://qiita.com/kimascript/items/e0eeccf262df26990613)
