# Protobuf

<img width="1134" height="425" alt="protobuf" src="https://github.com/user-attachments/assets/391ee322-69d8-4bcc-a0ac-bee2092cc3c6" />

## What is it?

- Protocol Buffers `protobuf` is a language neutral, plataform neutral and extensible mechanism developed by **Google** for serializing structured data. 
- It is significantly smaller, faster and simpler than `XML` or `JSON` and can be used to exchange data between services and applications.
- It uses `.proto` files to define the structure of the data and generate code for multiple languages.

## Comparisson with other serialization formats

The most common serialization formats are:

- `JSON`
- `protobuf`

| Feature        | JSON            | protobuf                    |
| -------------- | --------------- | --------------------------- |
| Human readable | Yes             | No (binary)                 |
| Schema         | Optional (JSON) | Mandatory (.proto)          |
| Performance    | Good (Browser)  | Highest                     |
| Size           | Small / Medium  | Small                       |
| Use cases      | Public APIs     | Internal / latency-critical |
| Ease of use    | Direct          | Moderate (requires tools)   |

## Install the compiler

In order to use `protobuf` we need to install the `protoc` compiler. You can follow the instructions to your operating system on the [Protobuf website](https://protobuf.dev/installation/)

To validate that the compiler is installed correctly, run:

```bash
protoc --version
```

## Install the language specific plugins

One of the advantages of `protobuf` is to be language agnostic, so we need to install the language-specific plugin for it to work

**For Go**

```bash
go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
```

**For TypeScript**

```bash
npm install protoc-gen-ts google-protobuf
```

## Create the `.proto` file

```proto
syntax = "proto3";

package example;

message Person {
    string name = 1;
    int32 age = 2;
}
```

## Generate the go code

```bash
protoc --go_out=. --go_opt=paths=source_relative person.proto
```

## Generate the typescript code

```bash
protoc \
    --plugin="protoc-gen-ts=./node_modules/.bin/protoc-gen-ts" \
    --ts_opt=esModuleInterop=true \
    --ts_out="./src/generated" \
    --proto_path="./schemas" \
    $(find "./schemas" -iname "*.proto")
```

## Downsides

- **Human readability** since it is binary format you can not just open a file and look at the contents
- **Not self describing** you must have the `.proto` file to be able to deserialize and understand the data
- **No random access** it is designed as a stream, so to access a field you *must* deserialize the entire object
- **Large Data Handling** it is not optimized for very large messages (over *1 Mb*)
- **Operantion complexity** it requires an extra *compilation step* to generate the code
- **Steeper learning curve** one more tool yet to learn
