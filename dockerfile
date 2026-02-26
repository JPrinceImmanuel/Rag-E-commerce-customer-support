# Use official Python slim image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Set environment variables


# Copy requirements first for layer caching
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Expose Chainlit default port
EXPOSE 8000

# Run the Chainlit app
CMD ["chainlit", "run", "customer_support_agent.py", "--host", "0.0.0.0", "--port", "8000"]
