import React, { useEffect, useState } from "react";

import {
  Card,
  CardHeader,
  CardTitle,
  Col,
  Row,
  CardBody,
  CardFooter,
  Button,
  CardImg,
  Carousel,
  CarouselItem,
} from "react-bootstrap";
import { Formik, Field, Form, ErrorMessage } from "formik";
import {
  updateBasicUserProfile,
  getCurrentUser,
  selectByParentId,
} from "services/usersService";
import PropTypes from "prop-types";
import { toast } from "react-toastify";
import "./ParentDash.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import gpa from "../../../src/assets/img/gallery/gpa.png";
import profileUpdateSchema from "components/schemas/studentDashboard";
import ParentForgotPWModal from "../pages/user/parent/ParentChangePWModal";
import ConnectToStudent from "components/pages/user/parent/ConnectToStudent";
import _logger from "sabio-debug";
import checked from "../../assets/img/gallery/prdashboardclosecheck.png";
import StudentCard from "components/pages/user/parent/StudentCard";
import MyEvents from "components/events/MyEvents";

_logger("Parent Dashboard");

function ParentDashboard({ currentUser }) {
  const [userInfo, setUserInfo] = useState({
    firstName: "",
    lastName: "",
    email: "",
    avatarUrl: "",
    id: 0,
    isConfirmed: false,
  });

  const [studentData, setStudentData] = useState([]);

  _logger(studentData);

  useEffect(() => {
    _logger("running CurrentUser");
    getCurrentUser().then(onSuccessCurrent).catch(onFailCurrent);
  }, []);

  const onSuccessCurrent = (response) => {
    _logger(response);
    const responseData = response.item;
    _logger(response.item);
    setUserInfo((prevState) => {
      let newUserInfo = { ...prevState };
      newUserInfo.firstName = responseData.firstName;
      newUserInfo.lastName = responseData.lastName;
      newUserInfo.email = responseData.email;
      newUserInfo.id = responseData.id;
      newUserInfo.isConfirmed = responseData.isConfirmed;
      return newUserInfo;
    });

    selectByParentId(responseData.id)
      .then(onStudentSuccess)
      .catch(onFailStudent);
  };

  const onStudentSuccess = (response) => {
    const studentRes = response.items;
    _logger(response);
    _logger(studentRes);

    setStudentData(studentRes);
  };

  const onFailCurrent = (err) => {
    _logger(err);
  };

  const handleSubmit = (values) => {
    updateBasicUserProfile(values)
      .then(onUpdateProfileSuccess)
      .catch(onUpdateProfileError);
  };

  const onUpdateProfileSuccess = () => {
    toast.success("Profile update was successful", {
      position: toast.POSITION.TOP_RIGHT,
    });
  };

  const onUpdateProfileError = (error) => {
    toast.error(
      `${error}Profile was not updated successfully, please try again`,
      {
        position: toast.POSITION.TOP_RIGHT,
      }
    );
  };

  const [index, setIndex] = useState(0);

  const handleSelect = (selectIndex) => {
    setIndex(selectIndex);
  };

  const [isConnected, setIsConnected] = useState(null);

  const childState = (e) => {
    _logger(e, isConnected, "child state caught in parent");

    setIsConnected(e);
  };

  const updateStudents = () => {
    selectByParentId(userInfo.id).then(onStudentSuccess).catch(onFailStudent);
  };

  const onFailStudent = (err) => {
    _logger(err);
  };

  return (
    <>
      <Row className="g-3 mb-3">
        <Col>
          {studentData.length >= 1 ? (
            <Carousel
              indicators={false}
              slide={true}
              activeIndex={index}
              onSelect={handleSelect}
              variant="dark"
            >
              {studentData.map((student, idx) => (
                <CarouselItem key={idx} className="">
                  <StudentCard fx={childState} students={student} />
                </CarouselItem>
              ))}
            </Carousel>
          ) : (
            <Card className="parent-dash-card">
              <CardHeader className="text-center">
                <CardTitle>Pending...</CardTitle>
              </CardHeader>
              <CardBody className="d-flex justify-content-center align-items-center">
                <FontAwesomeIcon
                  icon="fa-solid fa-user"
                  className="parent-dash-card-img"
                />
              </CardBody>
            </Card>
          )}
        </Col>

        <Col>
          <Card className="parent-dash-card">
            <CardHeader className="text-center">
              <CardTitle>Student GPA</CardTitle>
            </CardHeader>
            <CardBody className="d-flex justify-content-center align-items-center">
              <CardImg
                variant="center"
                src={gpa}
                alt="GPA"
                className="parent-dash-card-img"
              />
            </CardBody>
          </Card>
        </Col>

        <Col>
          <Card className="parent-dash-card">
            <CardHeader className="text-center">
              <CardTitle>Assigned Modules</CardTitle>
            </CardHeader>
            <CardBody className="d-flex justify-content-center align-items-center">
              <CardImg
                variant="center"
                src={checked}
                alt="GPA"
                className="parent-dash-card-img"
              />
            </CardBody>
          </Card>
        </Col>

        <Col>
          <Card className="parent-dash-card">
            <CardHeader className="text-center">
              <CardTitle>Completed Modules</CardTitle>
            </CardHeader>
            <CardBody className="d-flex justify-content-center align-items-center">
              <CardImg
                variant="center"
                src={checked}
                alt="GPA"
                className="parent-dash-card-img"
              />
            </CardBody>
          </Card>
        </Col>
      </Row>

      <div className="row g-3 mb-3">
        <div className="col-md-5 mb-4">
          <Card className="h-100 parent-dash-card">
            <CardHeader className="text-center">
              <CardTitle>
                {studentData.length >= 1
                  ? "Add Another Student"
                  : "Add Your Student"}
              </CardTitle>
            </CardHeader>
            <CardBody className=" d-flex justify-content-center align-items-center">
              <FontAwesomeIcon icon="fa-solid fa-users" size="9x" />
            </CardBody>

            <CardFooter className="text-center">
              <ConnectToStudent fx={updateStudents} />
            </CardFooter>
          </Card>
        </div>

        <div className="col-md-7 mb-4 ">
          <Card className="h-100">
            <CardHeader>
              <CardTitle className="text-center">
                Update Profile Information
              </CardTitle>
            </CardHeader>
            <CardBody>
              <div className="container text-center">
                <Formik
                  enableReinitialize={true}
                  initialValues={userInfo}
                  validationSchema={profileUpdateSchema}
                  onSubmit={handleSubmit}
                >
                  <Form>
                    <div>
                      <label htmlFor="firstName">First Name</label>
                      <Field
                        type="text"
                        className="form-control mx-auto w-50 "
                        name="firstName"
                      ></Field>
                      <ErrorMessage
                        name="firstName"
                        component="div"
                        className="PR-dash-error-message"
                      />
                    </div>
                    <div>
                      <label htmlFor="lastName">Last Name</label>
                      <Field
                        type="text"
                        className="form-control mx-auto w-50 "
                        name="lastName"
                      ></Field>
                      <ErrorMessage
                        name="lastName"
                        component="div"
                        className="pr-dash-error-message"
                      />
                    </div>
                    <div>
                      <label htmlFor="email">Email</label>
                      <Field
                        type="text"
                        className="form-control mx-auto w-50 "
                        name="email"
                      ></Field>
                      <ErrorMessage
                        name="email"
                        component="div"
                        className="pr-dash-error-message"
                      />
                    </div>
                    <div className=" d-flex justify-content-between mt-6 mb-4">
                      <Button type="button" href="/user/profilewizard">
                        Change Avatar
                      </Button>
                      <Button className="btn-primary" type="submit">
                        Update
                      </Button>
                      <ParentForgotPWModal />
                    </div>
                  </Form>
                </Formik>
              </div>
            </CardBody>
          </Card>
        </div>
      </div>
      <MyEvents currentUser={currentUser} />
    </>
  );
}
ParentDashboard.propTypes = {
  currentUser: PropTypes.shape({
    email: PropTypes.string.isRequired,
    role: PropTypes.number,
    id: PropTypes.number,
    firstName: PropTypes.string.isRequired,
    lastName: PropTypes.string.isRequired,
    mi: PropTypes.string,
    avatarUrl: PropTypes.string,
    isConfirmed: PropTypes.bool,
  }).isRequired,
};

export default ParentDashboard;
