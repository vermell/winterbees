FROM rust:slim-buster as builder

WORKDIR /usr/src/search-engine
RUN rustup default nightly

COPY . .
RUN cargo install --path search-engine

FROM debian:buster-slim
RUN apt-get update & apt-get install -y extra-runtime-dependencies & rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/search-engine /usr/local/bin/search-engine
CMD ["search-engine"]
