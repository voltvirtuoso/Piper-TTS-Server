# Piper TTS Dockerized Service  
A Dockerized implementation of the [Piper TTS](https://github.com/rhasspy/piper) text-to-speech engine, configured for easy deployment with Docker Compose.

## 📁 Project Structure  
```
.
├── docker-compose.yml      # Docker Compose configuration
├── Dockerfile              # Docker image build instructions
├── .env                    # Environment variables
├── models/                 # Directory to store TTS models (mounted) if not present create it
└── .gitignore              # Git ignore rules
```

## ⚙️ Prerequisites  
- [Docker](https://docs.docker.com/engine/install/) and [Docker Compose](https://docs.docker.com/compose/install/) installed.  
- A pre-trained [Piper TTS model](https://github.com/rhasspy/piper/releases) placed in the `models/` directory.  (if not downloaded it will automatically download)

## 🔧 Setup  
1. Clone this repository:  
   ```bash
   git clone https://github.com/voltvirtuoso/Piper-TTS-Server.git
   cd Piper-TTS-Server
   ```

2. Customize the `.env` file to set your preferred model and paths:  
   ```env
   PIPER_MODEL=en_US-lessac-medium  # Replace with your model name
   PIPER_DIR=/usr/local/piper        # Default container directory
   ```

3. Build and start the service:  
   ```bash
   docker-compose up -d --build
   ```

## 🚀 Usage  
The service exposes an HTTP API for text-to-speech conversion. Example request:  
Using `GET` request:
```bash
curl -G --data-urlencode 'text=This is a test.' -o test.wav 'localhost:5000'
```
Using `POST` request:
```bash
curl -X POST -H 'Content-Type: text/plain' --data 'This is a test.' -o test.wav 'localhost:5000'
```
## 🐳 Docker Commands  
- **Build**:
```bash
docker-compose build
```  
- **Run**:
```bash
docker-compose up -d
```  
- **Stop**:
```bash
docker-compose down
```  
- **Logs**:
```bash
docker-compose logs -f
```  

## 🎛️ Model Configuration  
1. Download a model from [Piper's releases](https://github.com/rhasspy/piper/releases).  
2. Place the `.onnx` model file in the `models/` directory.  
3. Update the `PIPER_MODEL` value in `.env` to match the model name.  

## 🧪 Testing  
- Use `test.wav` as a reference for output format.  
- Run the service and send a test request as shown above.  

## 📝 Notes  
- The `Dockerfile` installs dependencies and sets up the Piper environment.  
- The `network_mode: host` allows direct port access; adjust if conflicts arise.  
- For development, uncomment the port mapping in `docker-compose.yml`.  

## 📄 License  
MIT License (see [LICENSE](LICENSE) for details).  

---
