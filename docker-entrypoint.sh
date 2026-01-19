#!/bin/bash

# Create .streamlit directory if it doesn't exist
mkdir -p /app/.streamlit

# Create secrets.toml from environment variable
cat > /app/.streamlit/secrets.toml <<EOF
OPENAI_API_KEY = "${OPENAI_API_KEY}"
EOF

# Run Streamlit
exec streamlit run app.py --server.address=0.0.0.0 --server.port=8501
