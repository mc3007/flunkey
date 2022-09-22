class Restaurant {
  String restaurantName;
  String shortMessage;

  Restaurant({
    this.restaurantName='aa',
    this.shortMessage='bb'
  });

Restaurant.fromJson(Map<String, dynamic> json) {
  restaurantName = json['restaurentName'];
  shortMessage = json['shortMessage'];
}

}