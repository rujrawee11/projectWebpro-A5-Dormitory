<template>
  <div class="container is-widescreen">
    <section class="section">
      <div class="box is-fullwidth">
        <div class="columns">
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

          <div class="column is-10" v-if="error == 'not data'" >
            <div class="colummns">
              <div class="column">
                <button
                  class="delete is-pulled-right"
                  aria-label="close"
                  @click="showInvoice"
                ></button>
              </div>
            </div>
            <div
              class="has-text-centered mt-4 has-text-danger"
              style="font-weight: bold; font-size: 22px"
            >
              ยังไม่มีผู้เช่า
            </div>
          </div>
          <div class="column is-10" v-show="roomStatus == 'unavailable'">
            <div class="colummns">
              <div
                class="column p-4"
                style="background-color: #fab15c; color: white"
              >
                ห้อง {{ roomNumber}} {{ month }}/{{ year }}
                <button
                  class="delete is-pulled-right"
                  aria-label="close"
                  @click="showInvoice"
                ></button>
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
                      >ชื่อ : คุณ {{ firstName }}
                      {{ lastName }}</label
                    >
                    <label class="label">เบอร์โทร : {{ mobile }}</label>
                    <label class="label"
                      >เบอร์โทรสำรอง : {{phone }}</label
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
                    <label class="label has-text-success" v-if="status != ''">{{
                      status
                    }}</label>
                    <label class="label" v-if="status == ''" style="color: red"
                      >*บิลยังไม่ถูกส่งไปยังผู้เช่า</label
                    >
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
                    <div class="content has-text-centered" v-if="status == ''">
                      ยังไม่มีผู้เช่าเชื่อมต่อ
                    </div>
                    <div class="content" v-if="status != ''">
                      <span class="icon is-small pr-3">
                        <i class="fas fa-user" aria-hidden="true"></i> </span
                      >{{ blogs.first_name }} {{ blogs.last_name }}
                    </div>
                    <div class="content" v-if="status != ''">
                      <span class="icon is-small pr-3">
                        <i class="fas fa-headphones" aria-hidden="true"></i>
                      </span>
                      <a>{{ blogs.mobile }}</a>
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
                        type="number"
                        class="input"
                        v-model="commonFee"
                        placeholder=""
                        disabled
                      />
                    </td>
                  </tr>
                  <tr>
                    <td class="pt-3 pl-5">
                      ค่าใช้จ่ายเพิ่มเติม <span class="has-text-danger ">  *โปรดระบุรายการในช่องหมายเหตุ</span>
                      <button
                        class="button is-small is-danger is-pulled-right ml-2"
                        @click="saveDorm = false"
                        :style="{
                          visibility:
                            status == '' || status == 'edit bill'
                              ? 'visible'
                              : 'hidden',
                        }"
                      >
                        บันทึก
                      </button>
                      <button
                        class="button is-small is-info is-pulled-right"
                        @click="saveDorm = true"
                        :style="{
                          visibility:
                            status == '' || status == 'edit bill'
                              ? 'visible'
                              : 'hidden',
                        }"
                      >
                        แก้ไข
                      </button>
                    </td>
                    <td class="pt-3 pl-5">
                      <input
                        type="number"
                        class="input"
                        v-model="expensePrice" 
                        placeholder=""
                        :disabled="isDisabled"
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
                    <td class="level pt-3 pl-5">
                      รวมสุทธิ
                      <p
                        class="level-right mt-2 mr-1 has-text-danger"
                        v-if="disprice != 0"
                      >
                        - {{ disprice }}
                      </p>
                    </td>
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

            <div class="columns">
              <div class="column has-text-right">
                <button
                  class="button is-success mt-3"
                  v-if="status != 'APPROVED_BILL' && editBill == true"
                  @click="addDiscount = true"
                >
                  เพิ่มส่วนลด
                </button>
              </div>
            </div>
            <div class="box" style="border: solid 2px #e0e0de">
              <div class="level">
                <label class="label" style="width: 100px">หมายเหตุ : </label>
                <input
                  type="text"
                  v-model="note"
                  class="input"
                  placeholder=""
                  :disabled="isDisabled2"
                />
              </div>
            </div>
            <div class="columns">
              <div class="column has-text-right">
                <button
                  class="button is-primary is-normal mt-3"
                  style="width: 10%"
                  @click="showConfirmSend = true"
                  v-if="status == '' && editBill == false"
                >
                  <span class="icon mr-3">
                    <i class="fas fa-envelope-open-text"></i> </span
                  >ส่งบิล
                </button>
                <button
                  class="button is-primary is-normal mt-3"
                  style="width: 10%"
                  @click="editBillPrice"
                  v-if="
                    status != '' &&
                    status != 'edit bill' &&
                    status != 'APPROVED_BILL'"
                >
                  <span class="icon mr-3"> <i class="fas fa-edit"></i> </span
                  >แก้ไขบิล
                </button>
                <button
                  class="button is-primary is-normal mt-3"
                  style="width: 10%"
                  @click="updateBill"
                  v-if="status == 'edit bill' && editBill == true"
                >
                  <span class="icon mr-3 ml-1">
                    <i class="fas fa-envelope-open-text"></i> </span
                  >อัปเดตบิล
                </button>
                <button
                  class="button is-danger is-normal mt-3 ml-2"
                  style="width: 10%"
                  @click="cancle"
                  v-if="status == 'edit bill' && editBill == true"
                >
                  ยกเลิก
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="modal" :class="{ 'is-active': showConfirmSend }">
        <div class="modal-background"></div>
        <div class="modal-card">
          <header class="modal-card-head has-background-primary">
            <p class="modal-card-title has-text-centered has-text-white">
              Confirm Bill
            </p>
            <button
              class="delete"
              aria-label="close"
              @click="showConfirmSend = false"
            ></button>
          </header>

          <section class="modal-card-body">
            ยืนยันต้องการส่งใบแจ้งหนี้ไปยังผู้เช่า
          </section>
          <footer class="modal-card-foot" style="padding-left: 35%">
            <button
              class="button is-warning"
              type="submit"
              @click="confirmSend"
            >
              Confirm
            </button>

            <button class="button" @click="showConfirmSend = false">
              Cancel
            </button>
          </footer>
        </div>
      </div>

      <div class="modal" :class="{ 'is-active': showUpdateSend }">
        <div class="modal-background"></div>
        <div class="modal-card">
          <header class="modal-card-head has-background-primary">
            <p class="modal-card-title has-text-centered has-text-white">
              Confirm Bill
            </p>
            <button
              class="delete"
              aria-label="close"
              @click="showUpdateSend = false"
            ></button>
          </header>

          <section class="modal-card-body">
            ยืนยันต้องการเปลี่ยนแปลงข้อมูลใบแจ้งหนี้
          </section>
          <footer class="modal-card-foot" style="padding-left: 35%">
            <button
              class="button is-warning"
              type="submit"
              @click="updateSend()"
            >
              Update
            </button>

            <button class="button" @click="showUpdateSend = false">
              Cancel
            </button>
          </footer>
        </div>
      </div>

      <div class="modal" :class="{ 'is-active': addDiscount }">
        <div class="modal-background"></div>
        <div class="modal-card">
          <header class="modal-card-head has-background-info">
            <p class="modal-card-title has-text-centered has-text-white">
              เพิ่มส่วนลด
            </p>
            <button
              class="delete"
              aria-label="close"
              @click="addDiscount = false"
            ></button>
          </header>

          <section class="modal-card-body">
            <div class="columns mr-6">
              <div class="column">
                <div class="field is-horizontal">
                  <div class="field-label is-normal">
                    <label class="label mt-1" style="width: 100px"
                      >ส่วนลด :</label
                    >
                  </div>
                  <div class="field-body">
                    <div class="field">
                      <div class="control">
                        <input
                          class="input"
                          type="number"
                          v-model="$v.discountPrice.$model"
                          :class="{'is-danger': $v.discountPrice.$error}"
                          
                          placeholder="discount bath"
                        />
                        <template v-if="$v.discountPrice.$error">
                          <p class="help is-danger" v-if="!$v.discountPrice.discountPrice">
                            Invalid discountPrice Number
                          </p>
                          
                        </template>
                      </div>
                    </div>
                    <div class="field-label is-normal">
                      <label
                        class="label mt-1 mr-6 pr-6"
                        style="width: 100px; float: left"
                        >บาท</label
                      >
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>

          <footer
            class="modal-card-foot has-background-white"
            style="padding-left: 35%"
          >
            <button class="button is-danger" @click="discount" type="submit">
              ยืนยัน
            </button>

            <button
              style="margin-left: 20px"
              class="button"
              @click="cancleDiscount"
            >
              ยกเลิก
            </button>
          </footer>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import axios from "@/plugins/axios";
import { required } from "vuelidate/lib/validators";

function discountPrice(value) {
  return !!value.match(/[0-9]/);
}

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
      meter: [],
      saveDorm: false,
      showConfirmSend: false,
      showUpdateSend: false,
      month: "",
      year: "",
      status: "",
      invoice: [],
      editBill: false,
      note: "",
      disprice: 0,
      discountPrice: 0,
      addDiscount: false,
      expensePrice: 0,
      updated : false,
      roomStatus: "",
      roomNumber: "",
      firstName: "",
      lastName: "",
      mobile: "",
      phone: "",
    };
  },
  validations: {
    discountPrice: {
      required: required,
      discountPrice: discountPrice,
    },
  },
  mounted() {
    this.getBlogDetail(this.$route.params.id);
  },
  created() {

  },
computed: {
      isDisabled() {
        return this.saveDorm && (this.status == '' || this.status == 'edit bill')
      },
      isDisabled2() {
          return this.status == '' || this.status == 'edit bill';
        
      }
  },
  watch: {
    expensePrice(newVal, oldVal) {
      if (newVal == "" || oldVal == "") {
        let sum = this.roomRate + this.waterFee + this.electricity + this.commonFee + this.expensePrice;
        this.totalPre = sum.toFixed(2);
      
        this.tax = sum * 0.07;
        this.tax = this.tax.toFixed(2);

        let totalAll = sum + sum * 0.07;
        this.total = totalAll.toFixed(2);
      } else {
        let sum =
          this.roomRate +
          this.waterFee +
          this.electricity + this.commonFee +
          Number.parseFloat(this.expensePrice);

        this.totalPre = sum.toFixed(2);

        this.tax = sum * 0.07;
        this.tax = this.tax.toFixed(2);

        let totalAll = sum + sum * 0.07;
        this.total = totalAll.toFixed(2);
      }
    },
  },
  methods: {
    getBlogDetail(tenantId) {
      axios
        .get(`http://localhost:5000/Manageinvoice/sendInvoice/${tenantId}`)
        .then((response) => {
          this.blogs = response.data.dorm;
          this.meter = response.data.meter;
          this.invoice = response.data.invoice;
          if (this.invoice.length > 0) {
            this.status = this.invoice[0].status;
            this.note = this.invoice[0].note;
            this.disprice = this.invoice[0].discount;
            this.expensePrice = this.invoice[0].expenses;
            if (this.expensePrice == null || this.disprice == null || this.note == null) {
              this.expensePrice = 0;
              this.disprice = 0;
              this.note = '';
            }
          }

          this.roomStatus = this.blogs.room_status;
          this.roomNumber = this.blogs.room_number;
          this.firstName = this.blogs.first_name;
          this.lastName = this.blogs.last_name;
          this.mobile = this.blogs.mobile;
          this.phone = this.blogs.phone2;

          if (this.blogs.phone2 == null){
            this.phone = ""
          }


          this.commonFee = this.blogs.common_fee;
          this.roomRate = this.blogs.room_price;
          let water = this.meter.filter((a) => a.utilities_type == "WATER_FEE");
          this.waterFee = water[0].price;
          this.month = water[0].month;
          this.year = water[0].year;
          let electric = this.meter.filter(
            (a) => a.utilities_type == "ELECTRICITY_FEE"
          );
          this.electricity = electric[0].price;

          let sum = this.roomRate + this.waterFee + this.electricity + this.commonFee + 100;
          this.totalPre = sum
          this.tax = sum * 0.07;
          this.total = sum + sum * 0.07;

          /*  this.roomRate = this.roomRate.toFixed(2);
          this.waterFee = this.waterFee.toFixed(2);
          this.electricity = this.electricity.toFixed(2);
          this.commonFee = this.commonFee.toFixed(2); */
          this.tax = this.tax.toFixed(2);
          this.total = this.total.toFixed(2);
          this.totalPre = this.totalPre.toFixed(2);
        })
        .catch((error) => {
          this.error = 'not data';
        });
    },
    showInvoice() {
      this.$router.push({ name: "manageinvoice" });
    },
    confirmSend() {
      axios
        .post(`http://localhost:5000/sendBill`, {
          month: this.meter[0].month,
          room_number: this.blogs.room_number,
          year: this.meter[0].year,
          common_fee: this.commonFee,
          dorm_fee: this.roomRate,
          electricity_fee: this.electricity,
          water_fee: this.waterFee,
          expenses: this.expensePrice,
          discount: this.disprice,
          total: this.total,
          note: this.note,
          status: "UNAPPROVED_BILL",
          tenant_id: this.blogs.tenant_id,
        })
        .then((response) => {
          this.showConfirmSend = false;
          this.status = "UNAPPROVED_BILL";
          this.editBill = false;
        })
        .catch((error) => {
          this.error_room = error.response.data;
        });
    },
    updateSend() {
      axios
        .put(`http://localhost:5000/updateBill`, {
          expenses: this.expensePrice,
          total: this.total,
          discount: this.disprice,
          note: this.note,
          tenant_id: this.blogs.tenant_id,
        })
        .then((response) => {
          this.showUpdateSend = false;
          this.roomRate = this.roomRate.toFixed(2);
          this.waterFee = this.waterFee.toFixed(2);
          this.electricity = this.electricity.toFixed(2);
          this.saveDorm = false;
          this.commonFee = this.commonFee.toFixed(2);
          this.expensePrice = this.expensePrice.toFixed(2);
           this.status = "UNAPPROVED_BILL";
          this.editBill = false;
        })
        .catch((error) => {
          this.error_room = error.response.data;
         
        });
    },
    editBillPrice() {
      this.status = "edit bill";
      this.editBill = true;

    },
    cancle() {
      this.expensePrice = this.invoice[0].expenses;
      this.status = this.invoice[0].status;
      this.note = this.invoice[0].note;
      this.totalPre = this.roomRate + this.waterFee + this.electricity + this.commonFee + this.expensePrice;
      this.tax = this.totalPre * 0.07;
      this.total = this.totalPre + this.totalPre * 0.07;

      this.tax = this.tax.toFixed(2);
      this.total = this.total.toFixed(2);
      this.totalPre = this.totalPre.toFixed(2);

      this.disprice = this.invoice[0].discount;
      this.editBill = false;
    },
    discount() {
      this.$v.$touch();
      if (!this.$v.$invalid) {
        this.addDiscount = false;
        this.total = Number.parseFloat(this.total) - Number.parseFloat(this.discountPrice);
        this.disprice = Number.parseFloat(this.disprice) + Number.parseFloat(this.discountPrice);
        this.total = this.total.toFixed(2);
      }
    },
    cancleDiscount() {
      this.addDiscount = false;
      this.discountPrice = ''
    },
    updateBill () {
      this.showUpdateSend = true;
    }
  },
};
</script>