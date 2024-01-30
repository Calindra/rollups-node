export CARTESI_POSTGRES_ENDPOINT=postgres://postgres:password@localhost:5432/postgres
export CARTESI_BLOCKCHAIN_ID=31337
export CARTESI_BLOCKCHAIN_HTTP_ENDPOINT=http://localhost:8545
export CARTESI_BLOCKCHAIN_WS_ENDPOINT=ws://localhost:8545
export CARTESI_BLOCKCHAIN_IS_LEGACY=false
export CARTESI_BLOCKCHAIN_FINALITY_OFFSET=1
export CARTESI_CONTRACTS_DAPP_ADDRESS=0x180763470853cAF642Df79a908F9282c61692A45
export CARTESI_CONTRACTS_DAPP_DEPLOYMENT_BLOCK_NUMBER=17
export CARTESI_CONTRACTS_HISTORY_ADDRESS=0xbCc4067dfdeE8274E531951f0968EC895f397A44
export CARTESI_CONTRACTS_AUTHORITY_ADDRESS=0xb090149a3cA43000681B74875500854B54355496
export CARTESI_CONTRACTS_INPUT_BOX_ADDRESS=0xCf7Ed3AccA5a467e9e704C703E8D87F634fB0Fc9
export CARTESI_CONTRACTS_INPUT_BOX_DEPLOYMENT_BLOCK_NUMBER=17
export CARTESI_EPOCH_DURATION=120
export CARTESI_AUTH_MNEMONIC="test test test test test test test test test test test junk"
export CARTESI_LOG_LEVEL=info
export CARTESI_LOG_TIMESTAMP=false
export CARTESI_FEATURE_HOST_MODE=false
export CARTESI_FEATURE_READER_MODE=false
export CARTESI_HTTP_ADDRESS=0.0.0.0
export CARTESI_HTTP_PORT=10000
export CARTESI_SNAPSHOT_DIR=$PWD/machine-snapshot

rust_bin_path="$PWD/offchain/target/debug"
# Check if the path is already in $PATH
if [[ ":$PATH:" != *":$rust_bin_path:"* ]]; then
    export PATH=$PATH:$rust_bin_path
fi