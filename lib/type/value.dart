class Value<T> {
    T value;
    int extra = 0;
    Value();
    Value.withValue(T value) : this.value = value;
    void set(T value) {
        this.value = value;
    }
}