# Terraform – Cloud Architecture PoC

Este directorio contiene la definición de infraestructura como código (IaC) para un **caso práctico de arquitectura cloud**, utilizando **Terraform** y **Microsoft Azure**.

El objetivo es desplegar una aplicación web compuesta por frontend, backend, base de datos y almacenamiento, siguiendo buenas prácticas de modularidad, seguridad y observabilidad.

---

## 🧱 Arquitectura desplegada

La infraestructura creada incluye:

- **Resource Group** para la gobernanza de recursos
- **Azure Container Apps Environment**

  - Frontend (ingress público)
  - Backend (ingress interno)
  - Enrutamiento interno frontend → backend

- **Azure Container Registry (ACR)**
- **Azure SQL Server + Database**
- **Azure Blob Storage** (contenedor privado)
- **Log Analytics Workspace** para observabilidad

Todos los recursos se despliegan de forma **modular** y **reproducible**.

---

## 📁 Estructura del directorio

```text
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── terraform.tfvars.example
├── modules/
│   ├── resource-group/
│   ├── observability/
│   ├── container-registry/
│   ├── container-apps/
│   ├── sql-database/
│   └── storage-account/
```

Cada módulo representa una responsabilidad específica dentro de la arquitectura.

---

## 🔐 Manejo de variables sensibles

Las credenciales sensibles (por ejemplo, usuario y contraseña del SQL Server) **no se almacenan en archivos versionados**.

Se inyectan mediante **variables de entorno** usando el prefijo `TF_VAR_`.

Ejemplo:

```bash
export TF_VAR_sql_admin_username=sqladmin
export TF_VAR_sql_admin_password=SuperSecret123!
```

---

## ▶️ Cómo ejecutar el despliegue

### 1. Inicializar Terraform

```bash
terraform init
```

### 2. Validar el plan de ejecución

```bash
terraform plan
```

### 3. Aplicar la infraestructura

```bash
terraform apply
```

Al finalizar, Terraform mostrará los outputs relevantes, como la URL pública del frontend.

---

## 📌 Notas importantes

- Este proyecto corresponde a un **Proof of Concept (PoC)**.
- Medidas adicionales como **Private Endpoints**, **Key Vault** o **WAF** se consideran fuera de alcance para este ejercicio, pero pueden integrarse en una fase posterior.
- El uso de `terraform plan` sin cambios confirma que la infraestructura está sincronizada con el código.

---

## 🧪 Estado actual

```text
No changes. Your infrastructure matches the configuration.
```

Esto garantiza que **no existe drift** entre el estado real y la definición en Terraform.

---

## 📄 Licencia

Este proyecto se entrega exclusivamente con fines de evaluación técnica.
