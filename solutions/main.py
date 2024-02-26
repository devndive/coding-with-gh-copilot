from flask import Flask, jsonify, request

app = Flask(__name__)

# Define the menu
menu = [
    {"id": 1, "name": "Item 1", "price": 10.99},
    {"id": 2, "name": "Item 2", "price": 8.99},
    {"id": 3, "name": "Item 3", "price": 12.99},
    {"id": 4, "name": "Item 4", "price": 9.99},
    {"id": 5, "name": "Item 5", "price": 11.99}
]

@app.route('/menu', methods=['GET'])
def get_menu():
    # Return the menu as JSON
    return jsonify(menu)

@app.route('/order', methods=['POST'])
def place_order():
    order = request.get_json()  # Get the order data from the request
    total_price = 0

    # Calculate the total price based on the order
    for item in order:
        item_id = item.get('id')
        quantity = item.get('quantity')

        # Find the item in the menu
        menu_item = next((item for item in menu if item['id'] == item_id), None)

        if menu_item:
            item_price = menu_item['price']
            total_price += item_price * quantity

    # Return the total price as JSON
    return jsonify({'total_price': total_price})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)