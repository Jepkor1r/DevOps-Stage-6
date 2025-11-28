#!/bin/bash
SUBJECT="$1"
BODY="$2"
echo "$BODY" | mail -s "$SUBJECT" "$DRIFT_ALERT_EMAIL"