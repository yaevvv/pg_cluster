docker run -d \
    --name pg \
    -e POSTGRES_PASSWORD=password \
    -v /srv:/var/lib/postgresql/data \
    -p 5433:5433 \
    pg:cluster
docker cp rep.sh pg:/ 
docker exec -u postgres pg /rep.sh