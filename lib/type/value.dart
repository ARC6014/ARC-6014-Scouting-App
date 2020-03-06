class Value<T> {
    T value;
    void set(T value) {
        this.value = value;
    }
}

class Values<T> {
    List<T> values;
    void add(T value) {
        this.values.add(value);
    }
}