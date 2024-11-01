# Use a base image that includes Python 3.11.8
FROM python:3.11.8

# Set the working directory inside the container
WORKDIR /app

# Copy requirements file to the container
COPY requirements.txt .

# Install dependencies
RUN pip install -r requirements.txt

# Copy the rest of the application code to the container
COPY . .

# Set the environment variable for Flask
ENV FLASK_APP=crudapp.py
ENV EMAIL_API_KEY="<your_api_key_here>"
ENV EMAIL_ADDRESS="<sender_email>"

# Expose the port on which the app will run
EXPOSE 5000

# Command to run the application
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]


### COMMAND TO CREATE AN IMAGE
# docker build -t ncsu-campus-jobs .
# docker run -it -p 5000:5000 -e EMAIL_API_KEY=your_api_key_here -e EMAIL_ADDRESS=sender_email ncsu-campus-jobs

