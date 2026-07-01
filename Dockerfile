# --- Etapa 1: Construcción (Build) ---
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install

# --- Etapa 2: Producción ---
FROM node:18-alpine AS runner
WORKDIR /app

# SRE Best Practice: No correr como root por seguridad
USER node

# Copiamos solo lo necesario desde la etapa de builder
COPY --chown=node:node --from=builder /app/node_modules ./node_modules
COPY --chown=node:node . .

EXPOSE 3000
CMD ["node", "app.js"]