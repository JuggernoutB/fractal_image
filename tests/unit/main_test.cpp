#include <gtest/gtest.h>
#include "../../src/dummy/dummy.h"

TEST(BaseTest, BaseSub1Test)
{
  auto funcStr{"Hello world!"};
  auto res {func()};
  EXPECT_STREQ(res, funcStr);
}

int main(int argc, char **argv)
{
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}
