#! /bin/bash

# 'token-metadata-creator' binary
# obtain from https://github.com/input-output-hk/offchain-metadata-tools/releases/tag/v0.4.0.0
METADATA_CREATOR=~/token-metadata-creator

# USDr policy ID
POLICY_ID=45df5f274b8950b512b08d10656864958659c4ecf3ffad092ef63024

# Asset name (hex encoded)
USDR_ASSSET_NAME=55534472
SUSDR_ASSET_NAME=7355534472

USDR_SUBJECT=$POLICY_ID$USDR_ASSSET_NAME
SUSDR_SUBJECT=$POLICY_ID$SUSDR_ASSET_NAME

# TODO:
# Add signer -- need the skey
# Add URL


$METADATA_CREATOR entry --init $USDR_SUBJECT

$METADATA_CREATOR entry $USDR_SUBJECT \
  --name "USDr" \
  --description "Yield-bearing stablecoin by RealFi Co." \
  --ticker "USDR" \
  --decimals 6 \
  --logo usdr.png \
  -a signing-key.pk

USDR_JSON_FILE=$($METADATA_CREATOR entry $USDR_SUBJECT --finalize)

mv $USDR_JSON_FILE registry/$USDR_JSON_FILE

$METADATA_CREATOR entry --init $SUSDR_SUBJECT

$METADATA_CREATOR entry $SUSDR_SUBJECT \
  --name "sUSDr" \
  --description "staked USDr" \
  --ticker "SUSDR" \
  --decimals 6 \
  --logo susdr.png \
  -a signing-key.pk

SUSDR_JSON_FILE=$($METADATA_CREATOR entry $SUSDR_SUBJECT --finalize)

mv $SUSDR_JSON_FILE registry/$SUSDR_JSON_FILE