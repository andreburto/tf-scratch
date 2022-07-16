import boto3
import logging
import sys

logger = logging.getLogger(__file__)
logger.addHandler(logging.StreamHandler(sys.stdout))
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    logger.info("Hello, World!")


if __name__ == "__main__":
    lambda_handler(None, None)
