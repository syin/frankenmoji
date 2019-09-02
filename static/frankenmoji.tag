<frankenmoji>
    <div class="container">
        <div class="main">
            <div class="main-emoji">
                <img src="/static/assets/base.png" alt="faceless emoji base" class="emoji-base">
                <img each={ pickedFeature, category in pickedFeatures } if={ pickedFeature } src={ pickedFeature } class="emoji-feature">
            </div>
        </div>
        <div class="options">
            <div each={ items, category in categories } class="category">
                <h2>{ category }</h2>
                <div class="items">
                    <div class="item" each={ item, i in items }>
                        <img class="emoji-base" src="/static/assets/base.png" alt="">
                        <img src={ item } data-category={ category } onclick={ pickFeature } class="emoji-feature">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        self = this;

        self.categories = {};
        self.pickedFeatures = {
            "eyes": undefined,
            "head": undefined,
            "hands": undefined,
            "mouth": undefined,
        };

        self.on('mount', () => {
            self.getEmojiParts();
        });

        getEmojiParts() {
            const apiUrl = '/api/list';
            fetch(apiUrl).then(response => {
                response.json().then(data => {
                    Object.keys(data).forEach(category => {
                        self.categories[category] = data[category].map(imageName =>
                            `/static/assets/${category}/${imageName}`);
                    });
                    self.update();
                })
            }).catch(error => {
                console.log('error', error);
            });
        }

        pickFeature(e) {
            const pickedFeature = e.item.item;
            const category = e.target.dataset.category;
            console.log('picked', category, pickedFeature);

            if (self.pickedFeatures[category] === pickedFeature) {
                self.pickedFeatures[category] = undefined;
            } else {
                self.pickedFeatures[category] = pickedFeature;
            }
        }
    </script>
</frankenmoji>
