## Storage Systems

The proposed architecture uses a combination of specialized storage systems to meet the hospital’s diverse requirements. PostgreSQL is used as the OLTP database to manage transactional patient records, ensuring ACID compliance for critical operations such as updating treatment histories and billing data. A Data Lake (e.g., AWS S3) is used to store raw and unstructured data such as medical images, logs, and streaming device data, providing scalable and cost-effective storage.

For analytical reporting, a Data Warehouse (e.g., Snowflake or BigQuery) is used to store cleaned and structured data optimized for OLAP queries, enabling efficient generation of monthly reports such as bed occupancy and departmental costs. Additionally, a Vector Database (e.g., FAISS or Pinecone) is integrated to support semantic search over patient records, allowing doctors to query medical history using natural language.

## OLTP vs OLAP Boundary

The OLTP system consists of the PostgreSQL database handling real-time transactional operations such as patient admissions, updates, and billing. This system is optimized for fast inserts and updates with strict consistency requirements.

The OLAP system begins once data is extracted, transformed, and loaded into the Data Warehouse. This layer is optimized for complex analytical queries and reporting. The boundary between OLTP and OLAP is defined by the ETL pipeline, which transfers data from the transactional system to the analytical system after cleaning and transformation.

## Trade-offs

One significant trade-off in this architecture is between latency and consistency. Real-time data streaming from ICU devices requires low latency for immediate monitoring, while ensuring data consistency across systems can introduce delays.

To mitigate this, a hybrid approach is used where streaming data is first ingested into the Data Lake using a message broker such as Kafka, enabling real-time processing. Periodic batch processing is then used to ensure consistency in the Data Warehouse. Additionally, caching mechanisms can be implemented to provide quick access to frequently queried data without compromising system reliability.