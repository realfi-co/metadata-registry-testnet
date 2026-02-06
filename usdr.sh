#! /bin/bash

# 'token-metadata-creator' binary
# obtain from https://github.com/input-output-hk/offchain-metadata-tools/releases/tag/v0.4.0.0
METADATA_CREATOR=~/token-metadata-creator

# USDr policy ID
POLICY_ID=45df5f274b8950b512b08d10656864958659c4ecf3ffad092ef63024

# Asset name (hex encoded)
ASSSET_NAME=55534472

SUBJECT=$POLICY_ID$ASSET_NAME

$METADATA_CREATOR entry --init $SUBJECT

$METADATA_CREATOR entry $SUBJECT \
  --name "USDr" \
  --description "Yield-bearing stablecoin by RealFi Co." \
  --ticker "USDR" \
  --decimals 6

# TODO:
# Add signer -- need the skey
# Add URL
# Add logo (PNG)

JSON_FILE=$($METADATA_CREATOR entry $SUBJECT --finalize)

mv $JSON_FILE registry/$JSON_FILE