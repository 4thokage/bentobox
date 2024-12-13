<h1 align="center">BentoBox -- Web games</h1>

<p align="center">
  <a href="https://bentobox.ga">
    <img src="https://github.com/4thokage/bentobox/actions/workflows/docker-image.yml/badge.svg" alt="bentobox.ga" />
  </a>
  <img src="https://img.shields.io/github/commit-activity/w/4thokage/bentobox" alt="Commit Activity" />
</p>


<p align="center">https://trello.com/b/6w5xPcCS/roadmap</p>

## Development

> Node.js 20 or newer is recommended.

This project is structured as a monorepo using **pnpm** workspaces, separated into three packages:

- `client` - Next.js application for the front-end. 
- `server` - Node/Express.js application for the back-end.
- `types` - Shared type definitions required by the client and server.

### Getting started

1. Install [pnpm](https://pnpm.io/installation).
2. Install the necessary dependencies by running `pnpm install` in the root directory of the project.
3. In the `server` directory, create a `.env` file for your PostgreSQL database.
   ```env
   PGHOST=db.example.com
   PGUSER=exampleuser
   PGPASSWORD=examplepassword
   PGDATABASE=bentobox
   ```
4. Run the development servers with `pnpm dev`.
   - To run the frontend and backend servers separately, use `pnpm dev:client` and `pnpm dev:server`, respectively.
5. You can now access the frontend at http://localhost:3000 and the backend at http://localhost:3001.

## Running with Docker

To build the project with Docker, you can use the provided `Dockerfile`.
```sh
docker build -t bentobox .
```

This command will build the Docker image with the name `bentobox`. You can then run the image with the following command:
```sh
docker run -p 3000:3000 -p 3001:3001 bentobox
```

Once built, to start the project with POSTGRES, you can use the provided `docker-compose.yml` file.
```sh
docker-compose up
```
Please make sure to modify the values in the `server/.env` file to match the values in the `docker-compose.yml` file or vice versa.

The entrypoint for the Docker image is set to run pnpm.
The Dockerfile's `CMD` instruction is set to run the project in production mode. 
If you want to run the project in development mode, you can override the `CMD` instruction by running the following command:
```sh
docker run -p 3000:3000 -p 3001:3001 bentobox dev # runs both client and server in development mode
docker run -p 3000:3000 -p 3001:3001 bentobox dev:client # runs only the client in development mode
docker run -p 3000:3000 -p 3001:3001 bentobox dev:server # runs only the server in development mode
```
## License

[MIT](./LICENSE)
