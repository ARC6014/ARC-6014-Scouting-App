class Value<T> {
    T value;
    Value();
    Value.withValue(T value) : this.value = value;
    void set(T value) {
        this.value = value;
    }
}