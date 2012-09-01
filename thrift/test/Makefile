GEN_SRCS = gen-hs/Product_Consts.hs gen-hs/Product_Types.hs
SRCS     = test.hs

test: $(GEN_SRCS) $(SRCS)
	ghc --make $(GEN_SRCS) $(SRCS)

$(GEN_SRCS): product.thrift
	thrift --gen hs $<

.PHONY: clean
clean:
	find . -name '*.o' -o -name '*.hi' -o -name 'test' -type f | xargs -L1 rm -rf
	rm -rf gen-hs
