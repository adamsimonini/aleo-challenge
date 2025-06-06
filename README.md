# Aleo Todo List

A decentralized todo list application built on Aleo, demonstrating the use of structs, transitions, mappings, records, and asynchronous functions

## Features

- **Private Task Management**: Each todo item is associated with the creator's address
- **Unique Identification**: Secure todo identification using BHP256 hash of creator's address and count
- **Basic Operations**:
  - Add new todos with description, priority, and status
  - Remove existing todos using their unique identifier
  - Privacy-preserving state management

## Prerequisites

- [Leo](https://developer.aleo.org/leo/installation) programming language
- [snarkOS](https://developer.aleo.org/testnet/getting_started/installation) for local network
- Aleo account (will be created during setup)

## Quick Start

1. Clone the repository:

```bash
git clone https://github.com/yourusername/aleo-challenge.git
cd aleo-challenge
```

2. Build the program:

```bash
leo build
```

3. Create an Aleo account (if you don't have one):

```bash
leo account new
```

## Usage

### Adding a Todo

Create a new todo with a description, completion status, priority, and progress status:

```bash
leo execute add_todo '{
    description: [99u8,111u8,109u8,112u8,108u8,101u8,116u8,101u8,32u8,97u8,108u8,101u8,111u8,32u8,99u8,104u8,97u8,108u8,108u8,101u8,110u8,103u8,101u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8,0u8],
    completed: false,
    priority: 1u64,
    is_in_progress: false
}'
```

### Removing a Todo

Remove a todo using its identifier (the count when it was created):

```bash
leo execute remove_todo <count>
leo execute remove_todo 0u64
```

## Understanding Todo IDs

Todos are uniquely identified by combining:

1. The creator's address
2. A sequential counter (starting from 0)

This creates a unique, privacy-preserving identifier using BHP256 hashing:

```leo
let unique_id: field = BHP256::hash_to_field([caller_field, count_field]);
```

## Development

### Local Network Setup

For local development and testing:

```bash
cd snarkOS
./devnet.sh
```

### Deployment

Deploy to local network:

```bash
leo deploy --endpoint https://localhost:3030 --broadcast
```

Execute functions on local network:

```bash
leo execute --endpoint https://localhost:3030 --broadcast <function_name> <args>
```

## Testnet Deployment

Current testnet deployment: `at109cjj6l6zhkrhvmjf2j9x44umd0azu3f4y3xd9vff29eff9ucggstty40s`
