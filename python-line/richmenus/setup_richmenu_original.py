from linebot import (
    LineBotApi, WebhookHandler
)

from linebot.models import *

import argparse

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("-image", "--image", required=True, help="Rich menu image file path.")
    args = parser.parse_args()

    line_bot_api = LineBotApi(
        'aoJIEIKngOyuICLuscNEaJHyGjSGzO4i0iAG+ROnpHvaCW4/1AxLi1CBvRMrVg2OuJ2lKD9p2najA+5UP10TzjEq1sYxLJGfHHmXKiBmTPJ8vYqCFNxqN106MB+HgrTkWYE/qvvjv8/vyQD+T/r3vAdB04t89/1O/w1cDnyilFU=')
    handler = WebhookHandler('c6f3ddaff3d875a26d8b167a9e101247')

    rich_menu_to_create = RichMenu(
        size=RichMenuSize(width=2500, height=1686),
        selected=False,
        name="CocoTrace",
        chat_bar_text="Tap to open",
        areas=[
            RichMenuArea(bounds=RichMenuBounds(x=0, y=0, width=2450, height=840),
                         action=URIAction(label='Go to line.me', uri='https://line.me')
                         ),
            RichMenuArea(bounds=RichMenuBounds(x=0, y=843, width=2450, height=840),
                         action=URIAction(label='Go to line.me', uri='https://cocotrace.herokuapp.com')
                         )
        ]
    )

    rich_menu_id = line_bot_api.create_rich_menu(rich_menu=rich_menu_to_create)

    content_type = "image/png"

    with open(args.image, 'rb') as f:
        line_bot_api.set_rich_menu_image(rich_menu_id, content_type, f)

    line_bot_api.set_default_rich_menu(rich_menu_id)
    print("Rich Menu ID: ", rich_menu_id)
