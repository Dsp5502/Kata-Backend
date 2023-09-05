const express = require('express');
const axios = require('axios');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());

// Endpoint 1: Saludo
app.get('/api/', (req, res) => {
  res.status(200).json({ mensaje: 'hola mundo' });
});

// Endpoint 2: Suma
app.get('/api/suma', (req, res) => {
  const { num1, num2 } = req.query;
  const resultado = parseInt(num1) + parseInt(num2);
  res.status(200).json({ resultado });
});

// Endpoint 3: Usuario
app.get('/api/usuario/:nombre', (req, res) => {
  const { nombre } = req.params;
  res.status(200).json({ usuario: nombre });
});

// Endpoint 4: SWAPI
app.get('/api/swapi/:personajeId', async (req, res) => {
  const { personajeId } = req.params;
  try {
    const response = await axios.get(
      `https://swapi.dev/api/people/${personajeId}/`
    );
    const personaje = response.data;
    res.status(200).json({ personaje });
  } catch (error) {
    res.status(404).json({ mensaje: 'No se encontró el personaje solicitado' });
  }
});

// Endpoint 5: Body (PUT)
app.put('/api/body', (req, res) => {
  const bodyData = req.body;
  res.status(200).json(bodyData);
});

// Endpoint 6: Suma con Body (POST)
app.post('/api/suma-body', (req, res) => {
  const { num1, num2 } = req.body;
  const resultado = parseInt(num1) + parseInt(num2);
  res.status(200).json({ resultado });
});

// Endpoint 7: Eliminar objeto por ID (DELETE)
app.delete('/api/eliminar/:id', (req, res) => {
  const { id } = req.params;
  if (id === '3') {
    res.status(200).json({ mensaje: `Se ha eliminado el objeto con ID ${id}` });
  } else {
    res
      .status(404)
      .json({ mensaje: 'No se encontró el objeto con el ID especificado' });
  }
});

app.listen(PORT, () => {
  console.log(`Servidor en ejecución en el puerto ${PORT}`);
});
