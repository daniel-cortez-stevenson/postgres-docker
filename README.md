# postgres-docker

A docker-compose set up to run postgres on your local computer for testing - easy as that.

## Quickstart

```bash
docker-compose up db
docker-compose up metrics
docker-compose run --rm client

# shutdown
docker-compose down -v
```

## Example Data

### Amazon Reviews

Here are the [Docs](https://s3.amazonaws.com/amazon-reviews-pds/readme.html)

#### Set up

1. Download the German data

```bash
wget https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_multilingual_DE_v1_00.tsv.gz -O ./data/amazom_reviews_multilingual_DE_v1_00.tsv.gz
> --2020-08-02 04:26:02--  https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_multilingual_DE_v1_00.tsv.gz
> Resolving s3.amazonaws.com (s3.amazonaws.com)... 52.216.25.14
> Connecting to s3.amazonaws.com (s3.amazonaws.com)|52.216.25.14|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 241896005 (231M) [application/x-gzip]
> Saving to: ‘./data/amazom_reviews_multilingual_DE_v1_00.tsv.gz’
>
> ./data/amazom_revie 100%[===================>] 230.69M   622KB/s    in 97s
```

2. Decompress the data

```bash
gunzip ./data/amazom_reviews_multilingual_DE_v1_00.tsv.gz
```

3. Preprocess the data by escaping all literal `\` characters to protect the Postgres COPY command on dbinit

```bash
# MacOS (BSD) sed
sed -i -e 's/\\/\\\\/g' ./data/amazom_reviews_multilingual_DE_v1_00.tsv
```
