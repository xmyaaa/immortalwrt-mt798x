#!/bin/bash
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.
#
echo '替换golang到1.22.x'
rm -rf feeds/packages/lang/golang
git clone -b 22.x --single-branch https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang
echo '=========Replace golang OK!========='

echo '替换Passwall软件'
rm -rf feeds/luci/applications/luci-app-passwall/*
git clone -b main --single-branch https://github.com/xiaorouji/openwrt-passwall passwall
mv passwall/luci-app-passwall/* feeds/luci/applications/luci-app-passwall/
rm -rf passwall
echo '=========Replace passwall source OK!========='

echo '添加Passwall2软件'
echo '=========Replace passwall source OK!========='

echo '修改Passwall检测规则'

echo '=========ALTER passwall denpendcies check OK!========='

echo '修改默认IP'
sed -i 's/ipad=${ipaddr:-"192.168.1.1"}/ipad=${ipaddr:-"192.168.7.1"}/g' package/base-files/files/bin/config_generate
sed -i 's/addr_offset=2/addr_offset=8/g' package/base-files/files/bin/config_generate
sed -i 's/${ipaddr:-"192.168.$((addr_offset++)).1"}/${ipaddr:-"192.168.$((addr_offset++)).1"}/g' package/base-files/files/bin/config_generate
cat package/base-files/files/bin/config_generate |grep hostname=
echo '=========Link luci-app-passwall2!========='

# echo '开启sing-box的CGO标记'
# sed -i 's/CGO_ENABLED=0/CGO_ENABLED=1/g' feeds/passwall/sing-box/Makefile
# echo '=========Enable sing-box CGO FLAG OK !========='
