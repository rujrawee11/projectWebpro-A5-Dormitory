<template>
  <div class="container is-widescreen">
    <section class="section">
      <div class="box is-fullwidth">
        
        <div class="columns" >
          <div class="column is-2">
            <div
              class="box is-centered"
              style="background-color: #97b9ca; width: 150px; height: 120px"
            >
              <figure class="image is-64x64 my-auto ml-5 mr-3">
                <img
                  src="https://www.img.in.th/images/e44ec3a34de3558d4b0fdab7af698364.png"
                />
              </figure>
              <p class="has-text-centered" style="font-weight: bold">บิล</p>
            </div>
          </div>
          <div class="column is-10 has-text-centered mt-6 has-text-danger" style="font-weight: bold; font-size: 22px;" v-if="blogs.invoice_date == null"> ยังไม่มีบิลของเดือนนี้! </div>
          <div class="column is-10" v-if="blogs.invoice_date != null">
            <div class="colummns">
              <div
                class="column p-4"
                style="background-color: #fab15c; color: white"
              >
                ห้อง {{ blogs.room_number }} {{ blogs.month }}/{{ blogs.year }}
                
              </div>
            </div>
            <div class="columns">
              <div class="column is-6">
                <div
                  class="box ml-1 mt-5 p-5"
                  style="border: solid 2px #e0e0de"
                >
                  <div class="field mb-1">
                    <label class="label">รายละเอียดหัวบิล</label>
                    <label class="label"
                      >ชื่อ : คุณ{{ blogs.first_name }}
                      {{ blogs.last_name }}</label
                    >
                    <label class="label">เบอร์โทร : {{ blogs.mobile }}</label>
                    <label class="label"
                      >เบอร์โทรสำรอง : {{ blogs.phone2 }}</label
                    >
                  </div>
                </div>
              </div>
              <div class="column is-6">
                <div
                  class="box ml-4 mb-2 mt-5 mr-2 pl-3 pr-3 pb-1 pt-3"
                  style="border: solid 2px #e0e0de"
                >
                  <div class="level mb-2">
                    <label class="label">สถานะบิล</label>
                    <label class="label">{{ blogs.status }}</label>
                  </div>
                </div>
                <div
                  class="card ml-4 mt-0 mr-2 pl-3 pr-3 pb-0 pt-3"
                  style="border: solid 2px #e0e0de"
                >
                  <header class="card-header">
                    <p class="card-header-title">บิลจะถูกส่งไปให้ผู้เช่า</p>
                  </header>
                  <div class="card-content">
                    <div class="content">
                      <span class="icon is-small pr-3">
                        <i class="fas fa-user" aria-hidden="true"></i> </span
                      >{{ blogs.first_name }} {{ blogs.last_name }}
                    </div>
                    <div class="content">
                      <span class="icon is-small pr-3">
                        <i class="fas fa-headphones" aria-hidden="true"></i>
                      </span>
                      <a >{{ blogs.mobile }}</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="box is-12" style="border: solid 2px #e0e0de">
              <table class="table is-fullwidth has-text-left">
                <thead>
                  <tr
                    class="has-text-centered is-rounded"
                    style="border-bottom: solid 2px #e0e0de"
                  >
                    <th class="column-8 p-5">รายการ</th>
                    <th class="column-4 p-5">จำนวนเงิน(บาท)</th>
                  </tr>
                </thead>
                <tbody style="font-weight: bold">
                  <tr>
                    <td class="pt-3 pl-5 pt-2">
                      ค่าเช่าห้อง(Room rate) เลขห้อง เดือน ลำดับที่ของเดือน/ปี
                      
                      
                    </td>
                    <td class="pt-3 pl-5">
                      <input
                        type="text"
                        class="input"
                        placeholder=""
                        v-model="roomRate"
                        disabled
                      />
                    </td>
                  </tr>
                  <tr>
                    <td class="pt-3 pl-5">
                      ค่าน้ำ(Water rate) เดือน ลำดับที่ของเดือน/ปี (0 - 0 =
                      ยูนิต)
                    </td>
                    <td class="pt-3 pl-5">
                      <input
                        type="text"
                        class="input"
                        placeholder=""
                        v-model="waterFee"
                        disabled
                      />
                    </td>
                  </tr>
                  <tr>
                    <td class="pt-3 pl-5">
                      ค่าไฟฟ้า(Electrical rate) เดือน ลำดับที่ของเดือน/ปี (9000
                      - 8333 = 667 ยูนิต)
                    </td>
                    <td class="pt-3 pl-5">
                      <input
                        type="text"
                        class="input"
                        placeholder=""
                        v-model="electricity"
                        disabled
                      />
                    </td>
                  </tr>
                  <tr>
                    <td class="pt-3 pl-5">
                      ค่าส่วนกลาง(dorm free)
                      
                    </td>
                    <td class="pt-3 pl-5">
                      <input
                        type="text"
                        class="input"
                        v-model="commonFee"
                        placeholder=""
                        disabled
                      />
                    </td>
                  </tr>
                  <tr>
                    <td class="pt-3 pl-5">เงินรวมก่อนภาษี</td>
                    <td class="pt-3 pl-5">
                      <input
                        type="text"
                        class="input"
                        v-model="totalPre"
                        placeholder=""
                        disabled
                      />
                    </td>
                  </tr>
                  <tr>
                    <td class="pt-3 pl-5">ภาษีมูลค่าเพิ่ม 7 %</td>
                    <td class="pt-3 pl-5">
                      <input
                        type="text"
                        class="input"
                        placeholder=""
                        v-model="tax"
                        disabled
                      />
                    </td>
                  </tr>
                  <tr>
                    <td class="pt-3 pl-5">รวมสุทธิ</td>
                    <td class="pt-3 pl-5">
                      <input
                        type="text"
                        class="input"
                        placeholder=""
                        v-model="total"
                        disabled
                      />
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
             <div class="box" style="border: solid 2px #e0e0de">
              <div class="level-left">
                <label class="label mt-2" style="width: 100px">หมายเหตุ : </label>
                <label class="label has-text-danger" placeholder="">{{blogs.note}} </label>
              </div>
            </div>
            <div class="columns">
              <div class="column has-text-left has-text-danger">
                *หากชำระล่าช้าจะถูกทบในเดือนถัดไป
              </div>
              <div class="column has-text-right p-2">
                <button
                  class="button is-success is-normal mt-3"
                  style="width: 30%"
                >
                  <span class="icon mr-3">
                    <i class="fas fa-envelope-open-text"></i> </span
                  >จ่ายค่าห้อง
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "@/plugins/axios";

export default {
  name: "invoice",
  props: ["user"],
  data() {
    return {
      blogs: {},
      comments: [],
      images: [],
      error2: null,
      name: "",
      surname: "",
      address: "",
      tel1: "",
      tel2: "",
      error: {
        firstName: "",
        surName: "",
        phone1: "",
      },
      email: "",
      password: "",
      showProfileModal: false,
      showEmailModal: false,
      roomRate: 0,
      waterFee: 0,
      electricity: 0,
      commonFee: 0,
      totalPre: 0,
      tax: 0,
      total: 0,
    };
  },
  mounted() {
    this.getBlogDetail(this.$route.params.id);
  },
  created() {},
  watch: {},
  methods: {
    getBlogDetail(tenantId) {
      axios
        .get(`http://localhost:5000/showInvoice/${tenantId}`)
        .then((response) => {
          this.blogs = response.data.blog;
          this.roomRate = this.blogs.dorm_fee;
          this.waterFee = this.blogs.water_fee;
          this.electricity = this.blogs.electricity_fee;
          this.commonFee = this.blogs.common_fee;
          this.totalPre =
            this.roomRate + this.waterFee + this.electricity + this.commonFee;
          this.tax = this.totalPre * 0.07;
          this.total = this.totalPre + this.totalPre * 0.07;

          this.roomRate = this.roomRate.toFixed(2)
          this.waterFee = this.waterFee.toFixed(2)
          this.electricity = this.electricity.toFixed(2)
          this.commonFee = this.commonFee.toFixed(2)
          this.tax = this.tax.toFixed(2);
          this.total = this.total.toFixed(2);
          this.totalPre = this.totalPre.toFixed(2);
        })
        .catch((error) => {
          this.error = error.response.data.message;
        });
    },
    /* showInvoice() {
      this.$router.push({ name: "manageinvoice" });
    }, */
  },
};
</script>