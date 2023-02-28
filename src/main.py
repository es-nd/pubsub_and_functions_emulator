import base64


def main(event, _):
    pubsub_message = base64.b64decode(event['data']).decode('utf-8')
    print(f'pubsub_message: {pubsub_message}')

    return "OK"
