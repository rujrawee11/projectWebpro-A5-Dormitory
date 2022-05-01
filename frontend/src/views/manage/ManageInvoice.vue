<script src="/vue-formulate/dist/formulate.min.js"></script>
<template>
  <div class="container is-widescreen">
    <div class="columns">
      <div class="level has-text-centered mt-6 mb-1" style="margin-left: 37%">
        <div class="label mr-5" style="font-size: 20px">ตึก :</div>
        <div class="dropdown is-rounded is-active">
          <div class="dropdown-trigger">
            <button
              class="button"
              aria-haspopup="true"
              aria-controls="dropdown-menu"
              @click="dropdown_num = !dropdown_num"
            >
              <span>{{ this.dropdownName }}</span>
              <span class="icon is-small">
                <i
                  class="fas fa-angle-down"
                  aria-hidden="true"
                  @click="dropdown_num = !dropdown_num"
                ></i>
              </span>
            </button>
          </div>
          <div class="dropdown-menu" role="menu">
            <div class="dropdown-content" v-show="dropdown_num == true">
              <a @click="filterBuildAll" class="dropdown-item"> all </a>
              <a
                v-for="blog in build"
                :key="blog.build"
                @click="filterBuild(blog.build)"
                class="dropdown-item"
              >
                {{ blog.build }}
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="columns">
      <div class="level has-text-centered mt-1 mb-1" style="margin-left: 30%">
        <div class="label mr-2" style="font-size: 18px; width: 200px">
          ประจำเดือน :
        </div>
        <input class="input" type="month" v-model="monthInvoice" />
      </div>
    </div>
    <section class="section mt-1">
      <div v-for="(blog, index) in blogs" :key="index" class="columns">
        <div class="column is-12">
          <div
            class="p-4"
            style="
              background-color: #c4c4c4;
              font-weight: bold;
              font-size: 18px;
            "
          >
            ตึก {{ blog.build }}
          </div>

          <div class="columns">
            <div class="column is-12">
              <div
                class="mt-2 p-5"
                style="border: solid 2px #e0e0de; background-color: #f0f0f0"
              >
                <div
                  class="columns ml-5"
                  v-for="(floor, index) in floor"
                  :key="index"
                >
                  <div
                    class="box mr-5"
                    v-for="(room, index) in room"
                    @click="showInvoice(room)"
                    :style="{
                      'background-color':
                        room.room_status == 'unavailable'
                          ? '#48C78E'
                          : '#C0B7C7',
                      height: 10 + '%',
                      width: 15 + '%',
                      cursor: 'pointer',
                    }"
                    :key="index"
                    v-show="
                      room.build == blog.build && floor.floor == room.floor
                    "
                  >
                    <div
                      class="has-text-centered has-background-light mb-2"
                      style="font-weight: bold"
                    >
                      {{ room.room_number }}
                    </div>
                    <div class="columns pt-2">
                      <figure class="image is-64x64 my-auto ml-6 mr-2 pt-2">
                        <img :src="imagePath(room.room_status)" />
                      </figure>
                    </div>

                    <div class="has-text-centered"></div>
                  </div>
                </div>
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
      build: {},
      invoice: {},
      room: {},
      floor: {},
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
      count: 0,
      dropdown_num: false,
      filter: {},
      checkStatus: "",
      dropdownName: "----Select Build----",
      monthInvoice: "",
      date: "",
    };
  },
  mounted() {
    this.getBlogDetail();
  },
  created() {
   
  },
  watch: {},
  methods: {
    getBlogDetail() {
      axios
        .get(`http://localhost:5000/manageInvoice`)
        .then((response) => {
          this.blogs = response.data.blog;
          this.build = response.data.blog;
          this.room = response.data.room;
          this.checkStatus = this.room.status;
          this.floor = response.data.floor;
          this.invoice = response.data.invoice;
        })
        .catch((error) => {
          this.error2 = error.response.data.message;
        });
    },
    showInvoice(room) {
      this.$router.push({
        name: "sendInvoice",
        params: { id: room.room_number },
      });
    },
    filterBuild(build) {
      this.blogs = this.build.filter((e) => e.build === build);
      this.dropdownName = build;
    },
    filterBuildAll() {
      this.blogs = this.build;
      this.dropdownName = "all";
    },
    imagePath(checkStatus) {
      if (checkStatus == "unavailable") {
        return "http://localhost:5000/" + "/uploads/img1.png";
      } else {
        return "http://localhost:5000/" + "/uploads/bill2.png";
      }
    },
  },
};
</script>