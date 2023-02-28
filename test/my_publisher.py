#!/usr/bin/env python
# local 開発で使用。json データを publish するために必要。

import sys
from google.cloud import pubsub_v1


def publish_message(project_id: str, topic_id: str, file_path: str):
    # パブリッシャークライアントを作成
    publisher = pubsub_v1.PublisherClient()
    topic_path = publisher.topic_path(project_id, topic_id)

    # JSON ファイルを読み込み
    with open(file_path) as f:
        data_str = f.read()

    # メッセージをパブリッシュする
    data = data_str.encode("utf-8")
    future = publisher.publish(topic_path, data)
    future.result()

    return 0


if __name__ == "__main__":
    args = sys.argv
    project_id = args[1]
    topic_id = args[2]
    file_path = args[3]

    publish_message(project_id, topic_id, file_path)
