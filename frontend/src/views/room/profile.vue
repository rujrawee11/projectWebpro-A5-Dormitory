<template>
  <div class="container is-widescreen">
    <section class="section">
      <header class="modal-card-head has-background-primary">
        <p class="modal-card-title has-text-centered has-text-white">
          ข้อมูลผู้เช่าพัก ห้อง {{ $route.params.id }}
        </p>
        <button class="delete" aria-label="close" @click="showRoom"></button>
      </header>
      <div class="box">
        <div class="columns" v-if="error == 'not'">
          <div class="column is-12">
            <div class="column is-half is-offset-one-quarter has-text-centered">
              <div
                class="mt-5 has-text-danger"
                style="width: 100%; font-size: 20px; font-weight: bold"
              >
                ยังไม่มีผู้เช่า
              </div>
            </div>
          </div>
        </div>
        <div class="columns" v-show="users.room_status == 'unavailable'">
          <div class="column is-12">
            <div
              class="column p-3"
              style="background-color: #c4c2c2; color: white"
            >
              <span class="icon has-text-grey-dark is-small pr-3 ml-4">
                <i class="fas fa-user" aria-hidden="true"></i> </span
              >ข้อมูลส่วนตัว
            </div>
            <div
              class="column has-background-white-bis mt-4"
              style="
                margin-bottom: -1%;
                border-top: solid 3px #f2f2f0;
                border-bottom: solid 1px #f2f2f0;
                height: 75%;
              "
            >
              <div class="field is-horizontal">
                <div class="field is-normal">
                  <label class="label mt-2" style="width: 100px"
                    >ชื่อผู้เช่า :
                  </label>
                </div>
                <div class="field-body">
                  <div class="field">
                    <p class="control is-expanded">
                      <input
                        class="input"
                        type="text"
                        v-model="name"
                        placeholder="First name"
                        disabled
                      />
                    </p>
                  </div>

                  <div class="field">
                    <p class="control is-expanded">
                      <input
                        class="input"
                        type="text"
                        v-model="surname"
                        placeholder="Last name"
                        disabled
                      />
                    </p>
                  </div>
                </div>
              </div>

              <div class="column" style="margin-top: 0">
                <div class="field is-horizontal">
                  <div class="field is-normal">
                    <label class="label mt-2" style="width: 50px">เพศ : </label>
                  </div>
                  <div class="field-body">
                    <div class="field">
                      <p class="control is-expanded">
                        <input
                          class="input"
                          type="text"
                          v-model="sex"
                          placeholder="Sex"
                          disabled
                        />
                      </p>
                    </div>
                  </div>
                  <div class="field is-normal">
                    <label class="label mt-2 ml-3" style="width: 70px"
                      >วันเกิด :
                    </label>
                  </div>
                  <div class="field-body">
                    <div class="field">
                      <p class="control is-expanded">
                        <input
                          class="input"
                          type="text"
                          v-model="birthDay"
                          placeholder="Birth day"
                          disabled
                        />
                      </p>
                    </div>
                  </div>
                  <div class="field is-normal">
                    <label class="label mt-2 ml-3" style="width: 80px"
                      >เบอร์โทร1 :
                    </label>
                  </div>
                  <div class="field-body">
                    <div class="field">
                      <p class="control is-expanded">
                        <input
                          class="input"
                          type="text"
                          v-model="mobile1"
                          placeholder="mobile"
                          disabled
                        />
                      </p>
                    </div>
                  </div>
                  <div class="field is-normal">
                    <label class="label mt-2 ml-3" style="width: 80px"
                      >เบอร์โทร2 :
                    </label>
                  </div>
                  <div class="field-body">
                    <div class="field">
                      <p class="control is-expanded">
                        <input
                          class="input"
                          type="text"
                          v-model="mobile2"
                          placeholder="mobile"
                          disabled
                        />
                      </p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="columns" v-show="users.room_status == 'unavailable'">
          <div class="column is-12">
            <div
              class="column p-3"
              style="background-color: #c4c2c2; color: white"
            >
              <span class="icon has-text-grey-dark is-small pr-3 ml-4">
                <i class="fas fa-info-circle" aria-hidden="true"></i> </span
              >ข้อมูลสัญญาเช่า
            </div>
            <div
              class="column has-background-white-bis mt-4"
              style="
                margin-bottom: -1%;
                border-top: solid 3px #f2f2f0;
                border-bottom: solid 1px #f2f2f0;
                height: 70%;
              "
            >
              <div class="field is-horizontal">
                <div class="field is-normal">
                  <label class="label mt-2" style="width: 150px"
                    >วันเริ่มสัญญาเช่า :
                  </label>
                </div>
                <div class="field-body mr-5">
                  <div class="field">
                    <p class="control is-expanded">
                      <input
                        class="input"
                        type="text"
                        v-model="start_date"
                        placeholder="Start Date"
                        disabled
                      />
                    </p>
                  </div>
                </div>
                <div class="field is-normal">
                  <label class="label mt-2 ml-5" style="width: 150px"
                    >วันสิ้นสุดสัญญาเช่า :
                  </label>
                </div>
                <div class="field-body">
                  <div class="field">
                    <p class="control is-expanded">
                      <input
                        class="input"
                        type="text"
                        v-model="end_date"
                        placeholder="End Date"
                        disabled
                      />
                    </p>
                  </div>
                </div>
              </div>
              <div class="field is-horizontal is-pulled-right">
                <button
                  class="button is-primary is-rounded is-outlined is-small"
                  @click="contractDetail"
                >
                  ดูรายละเอียดสัญญาเช่า
                </button>
              </div>
            </div>
          </div>
        </div>

        <div class="columns" v-show="users.room_status == 'unavailable'">
          <div class="column is-12">
            <div
              class="column p-3"
              style="background-color: #c4c2c2; color: white"
            >
              <span class="icon has-text-grey-dark is-small pr-3 ml-4">
                <i class="fas fa-car" aria-hidden="true"></i> </span
              >ยานพาหนะ
            </div>

            <div
              class="column has-background-white-bis mt-4"
              style="
                margin-bottom: -1%;
                border-top: solid 3px #f2f2f0;
                border-bottom: solid 1px #f2f2f0;
              "
            >
              <div class="columns is-fullwidth" v-show="vehicles.length == 0">
                <div
                  class="column is-half is-offset-one-quarter has-text-centered"
                >
                  <label class="label mt-2 has-text-danger" style="width: 100%">
                    ไม่มีข้อมูลยานพาหนะ
                  </label>
                </div>
              </div>
              <div
                class="field is-horizontal"
                v-show="vehicles.length > 0"
                v-for="(vehicle, index) in vehicles"
                :key="index"
              >
                <div class="field is-normal">
                  <label class="label mt-2" style="width: 140px"
                    >คันที่ : {{ index + 1 }}
                  </label>
                </div>
                <div class="field is-normal">
                  <label class="label mt-2" style="width: 140px"
                    >ทะเบียนยานพาหนะ :
                  </label>
                </div>
                <div class="field-body mr-5">
                  <div class="field">
                    <p class="control is-expanded">
                      <input
                        class="input"
                        type="text"
                        placeholder="Start Date"
                        v-model="vehicle.license_plate"
                        style="width: 150px"
                        disabled
                      />
                    </p>
                  </div>
                </div>
                <div class="field is-normal">
                  <label class="label mt-2" style="width: 140px"
                    >สีของยานพาหนะ :
                  </label>
                </div>
                <div class="field-body mr-5">
                  <div class="field">
                    <p class="control is-expanded">
                      <input
                        class="input"
                        type="text"
                        placeholder="Start Date"
                        v-model="vehicle.color"
                        style="width: 150px"
                        disabled
                      />
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="modal" :class="{ 'is-active': showContract }" width="100%">
        <div class="modal-background"></div>
        <div class="modal-card" style="max-width: 960px; width: 90%">
          <header class="modal-card-head has-background-info">
            <p class="modal-card-title has-text-centered has-text-white">
              สัญญาเช่าหอพัก
            </p>
            <button
              class="delete"
              aria-label="close"
              @click="showContract = false"
            ></button>
          </header>

          <section class="modal-card-body">
            <div class="columns mr-1">
              <div class="column">
                <div class="field is-horizontal">
                  <div class="field-label is-normal">
                    <div style="width: 100%; font-weight: bold">
                      ทำที่ หอพัก A5
                    </div>
                    <div style="width: 100%; font-weight: bold">
                      วันที่ {{ start_date }}
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="columns mr-1 ml-3">
              <div class="column">
                <div class="field is-horizontal">
                  <div
                    class="
                      field-label
                      is-normal
                      has-text-left
                      is-justify-content
                    "
                  >
                    <div
                      class="column is-pulled-left is-justify-content"
                      style="width: 100%; float: left"
                    >
                      <p class="ml-6 pl-4">
                        สัญญานี้ทำขึ้นระหว่างระหว่าง
                        <b style="border-bottom: dotted 2px #cfcfcc"
                          >หอพัก A5</b
                        >
                        ที่อยู่
                        <b style="border-bottom: dotted 2px #cfcfcc"
                          >บ้านเลขที่ 1 ตำบล/แขวง ลาดกระบัง ซอยฉลองกรุง
                          เขตลาดกระบัง</b
                        >
                      </p>
                      <b style="border-bottom: dotted 2px #cfcfcc"
                        >จังหวัดกรุงเทพมหานคร</b
                      >
                      ซึ่งต่อไปในสัญญานี้จะเรียกว่า "ผู้ให้เช่า" ฝ่ายหนึ่งกับ
                      <b style="border-bottom: dotted 2px #cfcfcc">
                        คุณ {{ name }} {{ surname }}
                      </b>
                      ที่อยู่
                      <b style="border-bottom: dotted 2px #cfcfcc">
                        {{ address }}
                      </b>
                      ซึ่งต่อไปในสัญญานี้จะเรียกว่า "ผู้เช่า" อีกฝ่ายหนึ่ง

                      <p class="ml-6 pl-4">
                        ทั้งสองฝ่ายตกลงทำสัญญากันโดยมีข้อความดังต่อไปนี้
                      </p>
                    </div>

                    <div class="column is-justify-content">
                      <p class="ml-6 pl-4">
                        <b>ข้อ 1</b>
                        ผู้เช่าตกลงเช่าและผู้ให้เช่าตกลงให้เช่าห้องพักอาศัยห้องเลขที่
                        <b style="border-bottom: dotted 2px #cfcfcc">{{
                          room
                        }}</b>
                        ชั้นที่
                        <b style="border-bottom: dotted 2px #cfcfcc">{{
                          room.slice(1, 2)
                        }}</b>
                        ตึกที่
                        <b style="border-bottom: dotted 2px #cfcfcc">{{
                          room.slice(0, 1)
                        }}</b>
                        ของ หอพัก A5 ซึ่งหอพักตั้งอยู่ที่
                      </p>
                      <b style="border-bottom: dotted 2px #cfcfcc"
                        >บ้านเลขที่ 1 ตำบล/แขวง ลาดกระบัง ซอยฉลองกรุง
                        เขตลาดกระบัง จังหวัดกรุงเทพมหานคร</b
                      >
                      เพื่อใช้เป็น ที่พักอาศัย ในอัตราค่าเช่าเดือนละ
                      <b style="border-bottom: dotted 2px #cfcfcc">
                        {{ roomPrice }}
                      </b>
                      บาท ค่าเช่านี้ไม่รวมถึงค่าไฟฟ้า ค่าน้ำประปา ค่าส่วนกลาง
                      ค่าใช้จ่ายเพิ่มเติม
                      ซึ่งผู้เช่าต้องชำระแก่ผู้ให้เช่าตามอัตราที่กำหนดไว้ในสัญญาข้อ
                      4

                      <br />
                      <p class="ml-6 pl-4">
                        <b>ข้อ 2</b> ผู้เช่าตกลงเช่าห้องพักอาศัยตามสัญญาข้อ 1
                        มีกำหนดเวลา
                        <b style="border-bottom: dotted 2px #cfcfcc">
                          {{ years }} ปี
                        </b>
                        นับตั้งแต่วันที่
                        <b style="border-bottom: dotted 2px #cfcfcc">
                          {{ start_date }}
                        </b>
                        ถึงวันที่
                      </p>
                      <b style="border-bottom: dotted 2px #cfcfcc">{{
                        end_date
                      }}</b>

                      <p class="ml-6 pl-4">
                        <b>ข้อ 3</b>
                        การชำระค่าเช่าผู้เช่าตกลงจะชำระค่าเช่าแก่ผู้ให้เช่าเป็นการล่วงหน้าโดย<b
                          style="border-bottom: dotted 2px #cfcfcc"
                          >ชำระภายในวันที่ 10</b
                        >
                        ของทุกเดือนตลอดเวลา
                      </p>
                      อายุการเช่า
                      <br />
                      <p class="ml-6 pl-4">
                        <b>ข้อ 4</b> ผู้ให้เช่าคิดค่าไฟฟ้า ค่าน้ำประปา
                        ค่าส่วนกลาง ในอัตราดังนี้
                      </p>
                      <p class="ml-6 pl-6">(1) ค่าไฟฟ้ายูนิตละ 6 บาท</p>
                      <p class="ml-6 pl-6">
                        (2) ค่าน้ำประปาลูกบาศก์เมตรละ 6 บาท
                      </p>
                      <p class="ml-6 pl-6">(3) ค่าส่วนกลาง 500 บาท</p>
                      <p class="ml-6 pl-4">
                        <b>ข้อ 5</b> ผู้เช่าต้องชำระค่าไฟฟ้า ค่าน้ำประปา
                        ค่าส่วนกลาง
                        ตามจำนวนหน่วยที่ใช้ในแต่ละเดือนและต้องชำระพร้อมกับการชำระ
                      </p>
                      ค่าเช่าของเดือนถัดไป
                      <p class="ml-6 pl-4">
                        <b>ข้อ 6</b>
                        ผู้เช่าต้องดูแลห้องพักอาศัยและทรัพย์สินต่างๆ
                        ในห้องพักดังกล่าวเสมือนเป็นทรัพย์สินของตนเอง
                        และต้องรักษา
                      </p>
                      ความสะอาดตลอดจนรักษาความสงบเรียบร้อย
                      ไม่ก่อให้เกิดเสียงให้เป็นที่เดือดร้อนรำคาญแก่ผู้อยู่ห้องพักอาศัยข้างเคียง
                      <p class="ml-6 pl-4">
                        <b>ข้อ 7</b>
                        ผู้เช่าสัญญาว่าจะปฏิบัติตามระเบียบข้อบังคับของอพาร์ตเม้นต์ท้ายสัญญานี้
                        ซึ่งคู่สัญญาทั้งสองฝ่ายให้ถือว่าระเบียบ
                      </p>
                      ข้อบังคับดังกล่าวเป็นส่วนหนึ่งแห่งสัญญาเช่านี้ด้วย
                      หากผู้เช่าละเมิดแล้วผู้ให้เช่าย่อมให้สิทธิตามข้อ ๑๗ และข้อ
                      ๑๘ แห่งสัญญานี้ได้
                      <p class="ml-6 pl-4">
                        <b>ข้อ 8</b>
                        ผู้ให้เช่าไม่ต้องรับผิดชอบในความสูญหายหรือความเสียหายอย่างใดๆ
                        อันเกิดขึ้นแก่รถยนต์รวมทั้งทรัพย์สินต่างๆ ใน
                      </p>
                      รถยนต์ของผู้เช่า
                      ซึ่งได้นำมาจอดไว้ในที่จอดรถยนต์ที่ผู้ให้เช่าจัดไว้ให้
                      <p class="ml-6 pl-4">
                        <b>ข้อ 9</b>
                        ผู้เช่าตกลงว่าการผิดสัญญาเช่าเครื่องเรือนซึ่งผู้เช่าได้ทำไว้กับผู้ให้เช่าต่างหากจากสัญญานี้
                        ถือว่าเป็นการผิด
                      </p>
                      สัญญานี้ด้วยและโดยนัยเดียวกัน
                      การผิดสัญญานี้ย่อมถือเป็นการผิดสัญญาเช่าเครื่องเรือนด้วย
                      <div class="has-text-centered">
                        คู่สัญญาได้อ่านและเข้าใจข้อความในสัญญานี้โดยตลอดแล้วเห็นว่าถูกต้อง
                        จึงได้ลงลายมือชื่อไว้เป็นสำคัญต่อหน้าพยาน
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="columns mr-1">
              <div class="column">
                <div class="field is-horizontal">
                  <div class="field-label is-normal">
                    <div style="width: 100%; font-weight: bold">
                      ข้าพเจ้าขอยืนยันว่าสัญญาฉบับนี้เป็นความจริงทั้งหมด
                    </div>
                  </div>
                </div>
              </div>
            </div>
            
            <div class="columns mr-6">
              <div class="column is-6">
                
              </div>

              <div class="column is-6">
                <div class="field is-horizontal">
                  <div class="field-label is-normal">
                    <label class="label" style="width: 100px"
                      >ลงชื่อ</label
                    >
                  </div>
                  <div class="field-body">
                    <div class="field">
                      <div class="control">
                        <input
                          class="input is-rounded"
                          type="text"
                          v-model="fullname"
                          name="fullname"
                          placeholder="full name"
                          disabled
                        />
                      </div>
                    </div>
                  </div>
                  
                </div>
                <div class="ml-6 pl-5 has-text-centered" style="width: 100%; font-weight: bold">
                      วันที่ {{ start_date }}
                    </div>
              </div>
            </div>
                       
          </section>

          <footer
            class="modal-card-foot has-background-white"
            style="padding-left: 85%"
          >
            <button
              style="margin-left: 20px"
              class="button is-small is-link is-rounded "
              @click="showContract = false"
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

export default {
  name: "invoice",
  props: ["user"],
  data() {
    return {
      users: {},
      vehicles: {},
      contract: {},
      error2: null,
      name: "",
      surname: "",
      address: "",
      mobile1: "",
      mobile2: "",
      room: "",
      sex: "",
      birthDay: "",
      start_date: "",
      end_date: "",
      license: "",
      color: "",
      error: {
        firstName: "",
        surName: "",
        phone1: "",
      },
      showContract: false,
      years: "",
      fullname: "",
      roomPrice:0,
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
        .get(`http://localhost:5000/checkRoom/profile/${tenantId}`)
        .then((response) => {
          this.users = response.data.users;
          this.vehicles = response.data.vehicle;
          this.contract = response.data.contract;

          this.name = this.users.first_name;
          this.surname = this.users.last_name;
          this.fullname = this.users.first_name + ' ' +this.users.last_name
          this.mobile1 = this.users.mobile;
          this.mobile2 = this.users.phone2;
          this.sex = this.users.sex;
          this.birthDay = this.users.birth_day.slice(0, 10);

          this.roomPrice = this.contract.room_price
          this.address = this.contract.address;
          this.room = this.contract.room_number;
          this.start_date = this.contract.start_date.slice(0, 10);
          this.end_date = this.contract.end_date.slice(0, 10);

          let end = this.end_date.slice(0, 4)
          let start = this.start_date.slice(0, 4)
          this.years =  end - start;
          const date = new Date(
            this.start_date.slice(0, 4),
            this.start_date.slice(6, 7) - 1,
            this.start_date.slice(9, 10)
          );
          const result = date.toLocaleDateString("th-TH", {
            year: "numeric",
            month: "long",
            day: "numeric",
          });

          this.start_date = result;

          const date2 = new Date(
            this.end_date.slice(0, 4),
            this.end_date.slice(6, 7) - 1,
            this.end_date.slice(9, 10)
          );
          const result2 = date2.toLocaleDateString("th-TH", {
            year: "numeric",
            month: "long",
            day: "numeric",
          });

          this.end_date = result2;

           const date3 = new Date(
            this.birthDay.slice(0, 4),
            this.birthDay.slice(6, 7) - 1,
            this.birthDay.slice(9, 10)
          );
          const result3 = date3.toLocaleDateString("th-TH", {
            year: "numeric",
            month: "long",
            day: "numeric",
          });

          this.birthDay = result3;
        })
        .catch((error) => {
          this.error = 'not';
        });
    },
    showRoom() {
      this.$router.push({ name: "checkRoom" });
    },
    contractDetail() {
      this.showContract = true;
    },
  },
};
</script>