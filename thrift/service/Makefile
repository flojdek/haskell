GENERATED_SRCS = \
	gen-hs/ExpensesService_Client.hs \
	gen-hs/ExpensesService.hs \
	gen-hs/ExpensesService_Iface.hs \
	gen-hs/Product_Consts.hs \
	gen-hs/Product_Types.hs

SERVER_SRCS = $(GENERATED_SRCS) expensesserver.hs
CLIENT_SRCS = $(GENERATED_SRCS) expensesclient.hs

all: expensesserver expensesclient

expensesserver: $(SERVER_SRCS)
	ghc --make $(SERVER_SRCS)

expensesclient: $(CLIENT_SRCS)
	ghc --make $(CLIENT_SRCS)

$(GENERATED_SRCS): product.thrift
	thrift --gen hs $<

.PHONY: clean
clean:
	find . -name '*.o' -o -name '*.hi' -type f | xargs -L1 rm -rf
	rm -rf expensesserver expensesclient gen-hs
