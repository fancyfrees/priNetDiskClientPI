#ifndef PRINETDISKCLIENTPI_H
#define PRINETDISKCLIENTPI_H

#include <functional>
#include <string>
#include <vector>
#include <map>
#include "prinetdiskclient.h"
#include "nwmanagerclient.h"

class priNetDiskClientPI:public priNetDiskClient
{
public:
	priNetDiskClientPI(const std::string &clientName,const int &protoType = priNetDiskClient::TCP);
	void startServer();			// listen on the localPort
	void waitForTer();
	void initClient();
	void onSetOclientAddr(const std::string &);
};
#endif // PRINETDISKCLIENTPI_H
