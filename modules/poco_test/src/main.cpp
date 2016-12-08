#include "pch.h"

int main(int argc, char* argv[])
{
	try
	{
		std::cout << Poco::UUIDGenerator::defaultGenerator().createOne().toString() << std::endl;
	}
	catch (const Poco::SystemException& e)
	{
		std::cerr << e.className() << " " << e.what() << std::endl;
	}

	return 0;
}