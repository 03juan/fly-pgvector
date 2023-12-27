FROM flyio/postgres-flex:15.3
#flyio/postgres-flex-timescaledb:15.3

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        git \
        build-essential

RUN apt-get install -y --no-install-recommends postgresql-server-dev-15

WORKDIR /home

RUN git clone --branch v0.5.0 https://github.com/pgvector/pgvector.git
WORKDIR /home/pgvector
RUN make
RUN make install

WORKDIR /home
RUN git clone https://github.com/begriffs/pg_rational.git
WORKDIR /home/pg_rational
RUN make
RUN make install
