# SonarQube Report Generator

This project provides a Python application that extracts code quality details from a SonarQube server and generates an Excel report. The report includes metrics like code coverage, bugs, vulnerabilities, code smells, and duplications for all projects available in SonarQube. The application runs inside a Docker container and automatically fetches the latest details from SonarQube when executed.

## Features
- **SonarQube API Integration:** Fetches project details such as code coverage, bugs, vulnerabilities, duplications, and code smells.
- **Dynamic Excel Report:** Creates a well-formatted Excel report, including project metrics, color-coded based on severity and thresholds.
- **Code Coverage Visualization:** Color-coded cells for code coverage, turning green for ≥80% and red for <80%.
- **Issue Severity Counts:** Blocker, Critical, Major, and Minor issues are highlighted for each project.
- **Customizable:** Modify the Python script or the environment variables to adjust the report structure and data.
- **Run in Docker:** The application is encapsulated in a Docker container, ensuring ease of deployment.

## Requirements
To run this application, you need the following:
1. **SonarQube Server:** The application connects to a SonarQube server using the API.
2. **Docker:** Ensure Docker is installed on the host machine to run the application as a container.

## Setup and Installation

### Step 1: Clone the Repository

```bash
git clone https://github.com/your-repo/sonar-report-generator.git
cd sonar-report-generator
```
### Step 2: Environment Variables

SONARQUBE_URL: The URL of your SonarQube server (e.g., http://your-sonarqube-server:9000).
SONARQUBE_TOKEN: The SonarQube API token to authenticate requests.
APP_NAME: The application name that will be used in the report (default: TEST PROJECT).

### Step 3: Build the Docker Image

Use the following command to build the Docker image:
```bash
docker build -t sonar-report-generator .

### Step 4: Running the Application

After the image is built, run the application using the following Docker command:
```bash
docker run -e SONARQUBE_URL='http://your-sonarqube-server:9000' \
           -e SONARQUBE_TOKEN='your_sonarqube_token' \
           -e APP_NAME='TEST PROJECT' \
           -v /path/to/local/reports:/opt/sonar/reports \
           sonar-report-generator

-e SONARQUBE_URL: URL of the SonarQube instance.
-e SONARQUBE_TOKEN: Token for authenticating with SonarQube.
-e APP_NAME: Optional application name that will be used in the report title.
-v /path/to/local/reports:/opt/sonar/reports: Mount a local directory to store the generated report.

### Step 5: Output

Once the container runs, the application will:

Fetch project metrics and details from the SonarQube server.
Generate an Excel report and save it to the specified directory (inside the container at /opt/sonar/reports).
The filename will follow the format: <AppName>_SonarQube_Report_<YYYYMMDD>.xlsx.

### Step 6: Accessing the Report

After the application completes execution, check the local directory you mounted (/path/to/local/reports) for the generated report. The file will contain the code quality details for each SonarQube project in an easy-to-read format.



