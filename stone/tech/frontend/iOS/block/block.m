int main(int argc, const char * argv[]) {
    __block  int a = 6;
    void (^blk)(void) = ^{
        // printf("Block\n");
	a = a + 1;
    };
    blk();
    return 0;
}
