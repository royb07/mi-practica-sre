const express = require('express');
const { MongoClient } = require('mongodb');
const app = express();
const PORT = process.env.PORT || 3000;

const DB_URL = process.env.DATABASE_URL;

app.get('/', (req, res) => {
  res.json({ status: "ok", message: "Multi-contenedor con Docker Compose!" });
});

// Endpoint de salud que verifica la base de datos
app.get('/health', async (req, res) => {
  if (!DB_URL) {
    return res.status(500).json({ status: "DOWN", reason: "DATABASE_URL missing" });
  }
  
  try {
    const client = new MongoClient(DB_URL, { serverSelectionTimeoutMS: 2000 });
    await client.connect();
    await client.db("admin").command({ ping: 1 });
    await client.close();
    res.status(200).json({ status: "UP", database: "CONNECTED" });
  } catch (error) {
    console.error("[ERROR] Falló la conexión a la DB:", error.message);
    res.status(500).json({ status: "DOWN", database: "DISCONNECTED", error: error.message });
  }
});

app.listen(PORT, () => {
  console.log(`App corriendo en el puerto ${PORT}`);
});