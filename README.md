# GenLayer Validator Quick‑Start

## Overview
Deploy a validator node for <a href='https://www.genlayer.com/' target='_blank'>GenLayer</a> in just a few commands, using Docker Compose.  
_These steps follow the official <a href='https://docs.genlayer.com/validators/setup-guide' target='_blank'>Validator Setup Guide</a>._

---

## Requirements

### Hardware  
Check the official <a href='https://docs.genlayer.com/validators/setup-guide#system-requirements' target='_blank'>system requirements</a>.

### API Key  
You need a <a href='https://heurist.xyz/' target='_blank'>Heurist AI</a> key.  
Obtain one for free via the <a href='https://docs.genlayer.com/validators/setup-guide#genvm-configuration' target='_blank'>GenVM configuration guide</a>.
 
---

## Getting Started

<details>
<summary><strong>1 · Clone the repository (click to copy)</strong></summary>

```bash
git clone https://github.com/Sensei-Node/genlayer.git
cd genlayer
```

</details>

<details>
<summary><strong>2 · Show available versions</strong></summary>

```bash
./scripts/show-versions.sh
```

</details>

<details>
<summary><strong>3 · Create &amp; edit <code>.env</code></strong></summary>

```bash
cp default.env .env
```

Open <code>.env</code> and fill in:

| Variable                       | Description                          |
| ------------------------------ | ------------------------------------ |
| `PASSWORD`                     | For creating an account              |
| `HEURISTKEY`                   | Heurist AI API key                   |
| `TEST_VERSION`                 | **Latest** version printed in step 2 |
| `ZKSYNC_URL`                   | ZKZync rpc url                       |
| `ZKSYNC_URL_WS`                | ZKSync rpc url websocket             |
| `GENVM_PRECOPMILE`             | If you want precompile genvm         |
| `VALIDATOR_ADDRESS`            | Validator address for backup key     |
| `BACKUP_ENCRYPTION_PASSPHRASE` | Passphrase for backup key            |


</details>

<details>
<summary><strong>4 · Start the validator</strong></summary>

```bash
docker compose up -d
```

</details>

---

## Useful Links
- <a href='https://www.genlayer.com/' target='_blank'>GenLayer website</a>  
- <a href='https://docs.genlayer.com/validators/setup-guide' target='_blank'>Validator Setup Guide</a>  
- <a href='https://heurist.xyz/' target='_blank'>Heurist AI</a>

---

## Monitoring

The goal is that a local prometheus app, running in the same host as the Genlayer node, colects status data from it and sends it to a global prometheus server. Once it's there, data is exposed to the world through a dashboard.
If you only want to keep you node status in your local network you can select the prometheus config file in the `.env` file. Simply point the `PROM_CONFIG_FILE` to `prometheus/prometheus.local.yml`

### What info is collected?

- Your node address (supplied by the .env file)
- Node status. This includes:
  - global status
  - zksync status
  - zksync-websocket status
- Node timestamps. This includes:
  - zksync timestamp
  - zksync-websocket timestamp

### Grafana Dashboards

You can access the Grafana dashboard on port 3000. It includes three time-series panels:

- Global Status
- zkSync Status
- zkSync-WebSocket Status
