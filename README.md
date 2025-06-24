# Analysis & Documentation Template
This is a template, you can use this repository for all projects related with `Analysis & Documentacion` phase, we will use for this example the repository of [aptos](https://github.com/Sensei-Node/aptos). To be considered, `¡¡¡ YOU MUST USE YOUR OWN LINKS FROM THE PROTOCOL YOUR ARE DEVELOPING !!!`, just take as a reference the order of what is needed, as it is in this `Template`, if for some reason any section is empty use `N/A` and don't delete this.

The complete structure is as follows:

- i) [Protocol URL](https://github.com/Sensei-Node/project-template/blob/main/README.md#protocol-url)
- ii) [Technical References](https://github.com/Sensei-Node/project-template/blob/main/README.md#technical-references)
- iii) [Architecture](https://github.com/Sensei-Node/project-template/blob/main/README.md#architecture)
- iv) [Hardware Requirements (Testnet & Mainnet)](https://github.com/Sensei-Node/project-template/blob/main/README.md#hardware-requirements-testnet--mainnet)
- v) [Node Types](https://github.com/Sensei-Node/project-template/blob/main/README.md#node-types)
- vi) [Network Types](https://github.com/Sensei-Node/project-template/blob/main/README.md#network-types)
- vii) [Testnet Validators](https://github.com/Sensei-Node/project-template/blob/main/README.md#testnet-validators)
- viii) [Security](https://github.com/Sensei-Node/project-template/blob/main/README.md#security)
- ix) [Explorers](https://github.com/Sensei-Node/project-template/blob/main/README.md#aptos-explorers)
- x) [Ports](https://github.com/Sensei-Node/project-template/blob/main/README.md#port-settings)
- xi) [Testnet Tokens](https://github.com/Sensei-Node/project-template/blob/main/README.md#how-to-get-aptos-testnet-tokens-apt-to-register-the-validator)
- xii) [Repository](https://github.com/Sensei-Node/project-template/blob/main/README.md#github-repository)

### **Protocol URL**

`In this section you need use all URL related with the protocol, something like this:`

- **Aptos Foundation:** https://aptosfoundation.org/get-started

### Technical References

`Technical references involved in the project and who have done the Analysis and Documentation. For example:`

- Luis | luis@senseinode.com
- Efrain | efrain@senseinode.com

### Architecture

`Architecture of the protocol to be used, you can use a image if you want, example:`

![aptos-architecture](https://github.com/Sensei-Node/project-template/assets/86749595/02b63369-bc28-4218-9e0e-07892da87e40)

### Hardware Requirements (Testnet & Mainnet)

`Specify necessary Testnet and Mainnet hardware requirements for the Node:`

- **CPU**: 32 cores, 2.8GHz, or faster, AMD Milan EPYC or Intel(R) Xeon(R) Platinum
- **Memory**: 64GB RAM.
- **Storage**: 2T SSD with at least 60K IOPS and 200MiB/s bandwidth.
    
    > Start with 700GB if you can upgrade storage
    > 
- **Networking bandwidth**: 1Gbps

`Important tips to consider:`

Generally, the size of the database on each machine is a function of the ledger history (i.e., the number of transactions in the blockchain history) and the number of on-chain states (e.g., accounts and resources). Both the ledger history and the number of on-chain states depend on several additional factors, including the age of the blockchain, the average transaction rate over time, and the configuration of the ledger database pruner. At the time of writing, we estimate that **testnet** and **mainnet** require several 100's of GB of storage.

- Example machine types that meet the reference specs (on various clouds):
    - **AWS**
        - c6id.16xlarge (if using a local SSD).
        - c6i.16xlarge + io2 EBS volume with 60K IOPS.
    - **GCP**
        - t2d-standard-60 + pd-ssd with 60K IOPS.

`Add links to official documentation:`

**Source:** 

[Node Requirements | Aptos Docs](https://aptos.dev/nodes/validator-node/operator/node-requirements#hardware-requirements)

### Node Types

`Specify the types of Nodes that the protocol has with a brief description of each and links to the official documentation:`

- **Validator Nodes**

`Short description here and link to the docs below..`

**Source:**

[Validator Nodes Overview | Aptos Docs](https://aptos.dev/concepts/validator-nodes)

### Network Types

`Specify the types of Networks that the protocol has with a brief description of each and link to the official documentation:`

- **Validator network:** Validators connect to each other over this network. Validator fullnodes (VFNs) and public fullnodes (PFNs) do not use this network.
- **VFN network:** The validator fullnode (VFN) network allows a validator and VFN pair to connect to each other. This network is private between the validator and the VFN.
- **Public network:** The public network allows VFNs and public fullnodes (PFNs) to connect to other VFNs and PFNs. This allows public node operators to access the blockchain.

**Source:** 

[Node Requirements | Aptos Docs](https://aptos.dev/nodes/validator-node/operator/node-requirements#network-types)

### Testnet Validators

`Add the Testnet validators, specify how they are used, with which tools, commands and add documentation:`

**i) Validator Files:**

**docker-compose.yaml**[](https://aptos.dev/nodes/node-files-all-networks/node-files-testnet/#docker-composeyaml)

- **Git repo: `core-repository`**
- **Git branch: `testnet` on https://github.com/aptos-labs/aptos-core**
- **Command to download:**
    
    ```bash
      command to be used
    ```

**validator.yaml**[](https://aptos.dev/nodes/node-files-all-networks/node-files-testnet/#validatoryaml)

- **Git repo:** `core-repository`
- **Git branch:** `testnet` on https://github.com/aptos-labs/aptos-core
- **Command to download:**
    
    ```bash
      command to be used
    ```
**Source:**

[Files For Testnet | Aptos Docs](https://aptos.dev/nodes/node-files-all-networks/node-files-testnet)

### Security

`Adding security considerations with links to documentation:`

Each of the different state sync syncing modes perform data integrity verifications to ensure that the data being synced to the node has been correctly produced and signed by the validators. This occurs slightly differently for each syncing mode:

- **Executing transactions**: Executing transactions from genesis is the most secure syncing mode. It will verify that all transactions since the beginning of time were correctly agreed upon by consensus and that all transactions were correctly executed by the validators. All resulting blockchain state will thus be re-verified by the syncing node.

**Source:**

[State Synchronization | Aptos Docs](https://aptos.dev/guides/state-sync/#executing-all-transactions)

### Aptos Explorers

`Adding Protocol explorers (Testnet & Mainnet) with links:`

- Testnet:

[Aptos Explorer](https://explorer.aptoslabs.com/?network=testnet)

- Mainnet:

[Aptos Explorer](https://explorer.aptoslabs.com/?network=mainnet)

### Port Settings

`Add specific Ports to be used as Open and Closed with security in mind:`

| Port # | Firewall/adapter | Purpose | Comments |
| --- | --- | --- | --- |
| 6182 | open | Aptos Public network | PFN |
| 9101 | closed | Aptos Inspection service | PFN |
| 9102 | closed | Aptos Admin service | PFN |
| 80/8080  | closed | Aptos REST API | PFN |

The inspection service port (`9101`), admin service port (`9102`) and the REST API port (`80` or `8080`) are likely useful for your internal network, e.g., application development and debugging. However, the inspection service port and the admin service port should never be exposed publicly as they can be easily abused. Similarly, if you choose to expose the REST API endpoint publicly, you should deploy an additional authentication or rate-limiting mechanism to prevent abuse.

### How to get Aptos Testnet Tokens `APT` to register the Validator

`Indicate instructions on how to obtain APT tokens on Testnet, example:`

#### Petra Aptos Wallet

To obtain Aptos blockchain tokens (`APT`), the following steps must be followed:

- i) Crear wallet compatible con Aptos => [Petra Aptos Wallet](https://chromewebstore.google.com/detail/petra-aptos-wallet/ejjladinnckdgjemekebdpeokbikhfci)
- ii) Go to `Settings` , after go to `Network` and select `Testnet`
- iii) Go to `Home` and click on `Faucet`, faucet allow only 10 APT tokens

#### Aptos CLI

We can also obtain tokens through the Aptos CLI:

- Install CLI by Script:
https://aptos.dev/tools/aptos-cli/install-cli/automated-install
- Configure your CLI: https://aptos.dev/tools/aptos-cli/use-cli/cli-configuration
- Use the Aptos CLI in the `Account` section, to fund an account follow the instructions:
https://aptos.dev/tools/aptos-cli/use-cli/cli-account

### GitHub repository

`Official GitHub repository of the protocol, example:`

- Aptos core: https://github.com/aptos-labs/aptos-core

### Contributing 
I hope this is useful and any contribution is welcome!
- Made with ❤️ by [Sensei Team](https://github.com/orgs/Sensei-Node/people)
