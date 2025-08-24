FROM python:3.11-slim

WORKDIR /app

# Copy requirements and install dependencies
COPY pyproject.toml README.md ./
RUN pip install --no-cache-dir -e .

# Copy source code
COPY src/ ./src/
COPY main.py ./

# Set environment variable for the entry point
ENV PYTHONPATH=/app/src

# Expose port if needed (MCP typically doesn't need external ports)
# EXPOSE 8000

# Run the application
CMD ["python", "main.py"]
