<frankenmoji>
    <div class="container">
        <div class="main">
            <img src="/static/assets/base.png" alt="faceless emoji base">
        </div>
        <div class="options">
            <div each={ category in categories } class="category">
                <h2>{ category.name }</h2>
                <div class="items">
                    <div class="item" each={ item in category.items }>
                        <img class="emoji-base" src="/static/assets/base.png" alt="">
                        <img src={ item.url } alt="" class="emoji-feature">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        self = this;

        self.categories = [
            {
                "name": "hat",
                "items": []
            },
            {
                "name": "eyes",
                "items": [
                    {"url": "/static/assets/eyes/angry face.png"},
                    {"url": "/static/assets/eyes/crying tears.png"},
                    {"url": "/static/assets/eyes/eyebrow raise.png"},
                    {"url": "/static/assets/eyes/heart eyes.png"},
                    {"url": "/static/assets/eyes/low eyes.png"},
                    {"url": "/static/assets/eyes/monocle.png"},
                    {"url": "/static/assets/eyes/neutral eyes.png"},
                    {"url": "/static/assets/eyes/neutral eyes 2.png"},
                    {"url": "/static/assets/eyes/rolling eyes.png"},
                    {"url": "/static/assets/eyes/small smile copy.png"},
                    {"url": "/static/assets/eyes/sunglasses.png"},
                    {"url": "/static/assets/eyes/uneven eyes.png"},
                    {"url": "/static/assets/eyes/uwu eyes.png"},
                ]
            },
            {
                "name": "mouth",
                "items": []
            },
            {
                "name": "hands",
                "items": []
            },
            {
                "name": "extraz",
                "items": []
            },
        ]
    </script>
</frankenmoji>
